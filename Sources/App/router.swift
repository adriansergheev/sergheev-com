import Vapor
import Foundation
import Dependencies
@preconcurrency import VaporRouting

extension DependencyValues {
  var siteRouter: SiteRouter {
    get { self[SiteRouter.self] }
    set { self[SiteRouter.self] = newValue }
  }
}
extension SiteRouter: DependencyKey {
  static let liveValue = SiteRouter()
}

typealias Router<Output> = ParserPrinter<URLRequestData, Output>

struct SiteRouter: ParserPrinter {
  var body: some Router<SiteRoute> {
    OneOf {
      Route(.case(SiteRoute.home))
      Route(.case(SiteRoute.posts)) {
        Path { "posts" }
        OneOf {
          Route(.case(PostsRoute.post)) {
            Path { Digits() }
          }
        }
      }
      Route(.case(SiteRoute.rss)) {
        Path { "rss.xml" }
      }
      Route(.case(SiteRoute.privacyPolicy)) {
        Path { "privacy-policy" }
      }
      Route(.case(SiteRoute.howLongShouldAHumanLive)) {
        Path { "the-case-against-curing-aging" }
      }
      Route(.case(SiteRoute.subscribe)) {
        Path { "subscribe" }
        OneOf {
          Parse {
            Method.post
          }
          Parse {
            Method.get
          }
        }
      }
    }
  }
}

enum SiteRoute {
  case home
  case posts(PostsRoute)
  case rss
  case privacyPolicy
  case howLongShouldAHumanLive
  case subscribe

  struct SubscribeData: Codable {
    let email: String
    let name: String
  }
}

extension SiteRoute.SubscribeData {
  func isNotBot() -> Bool {
    name.isEmpty
  }
}

enum PostsRoute {
  case post(Int)
}

func siteHandler(
  request: Request,
  route: SiteRoute
) async throws -> AsyncResponseEncodable {
  switch route {
  case .home:
    let posts = posts
      .map { key, value in (key, "\(formattedDate(forPostID: key)) - \(value.title)") }
      .sorted { first, second in first.0 > second.0 }

    return layout(
      title: "home",
      content: homePage(posts),
      backButton: false
    )
  case let .posts(route):
    return try await postsHandler(
      request: request,
      route: route
    )
  case .rss:
    feedFetch(request)
    let response = Response(body: .init(string: rssFeed(router: request.application.router)))
    response.headers.contentType = HTTPMediaType(
      type: "application",
      subType: "rss+xml",
      parameters: ["charset": "utf-8"]
    )
    return response
  case .privacyPolicy:
    return layout(
      title: "privacy policy",
      content: privacyPolicy()
    )
  case .howLongShouldAHumanLive:
    return howLongPage()
  case .subscribe:
    @Dependency(\.telegram) var telegram
    if request.method == .POST {
      let formData = try request.content.decode(SiteRoute.SubscribeData.self)
      do {
        if formData.isNotBot() {
          try await telegram.send("New subscriber: \(formData.email)", using: request.client)
        }
        return layout(title: "subscribed", content: "👍", backButton: true)
      } catch {
        request.logger.error("Failed to subscribe: \(error)")
        throw Abort(.internalServerError)
      }
    }
    return layout(
      title: "subscribe",
      content: subscribe()
    )
  }
}

func postDate(forPostID id: Int) -> Date? {
  @Dependency(\.calendar) var calendar
  let s = String(id)
  guard s.count == 8,
    let year = Int(s.prefix(4)),
    let month = Int(s.dropFirst(4).prefix(2)),
    let day = Int(s.suffix(2))
  else { return nil }
  return calendar.date(from: DateComponents(year: year, month: month, day: day))
}

func formattedDate(forPostID id: Int) -> String {
  guard let date = postDate(forPostID: id) else { return "" }
  let formatter = DateFormatter()
  formatter.dateFormat = "MMM d, yyyy"
  return formatter.string(from: date)
}

func postsHandler(
  request: Request,
  route: PostsRoute
) async throws -> AsyncResponseEncodable {
  switch route {
  case let .post(id):
    @Dependency(\.siteRouter) var router
    let url = router.url(for: .posts(.post(id)))
    if let post = posts[id] {
      return layout(
        title: post.title,
        content: .raw(post.content),
        usePrismJS: true
      )
    } else {
      request.logger.debug(.init(stringLiteral: "no post for \(id), \(url)"))
      throw Abort(.notFound)
    }
  }
}
