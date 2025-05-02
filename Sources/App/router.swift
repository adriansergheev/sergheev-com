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
      Route(.case(SiteRoute.photoGuessrAppStore)) {
        Path { "photoguessr-appstore" }
      }
      Route(.case(SiteRoute.posts)) {
        Path { "posts" }
        OneOf {
          Route(.case(PostsRoute.post)) {
            Path { Digits() }
          }
        }
      }
      Route(.case(SiteRoute.privacyPolicy)) {
        Path { "privacy-policy" }
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
  case photoGuessrAppStore
  case posts(PostsRoute)
  case privacyPolicy
  case subscribe

  struct SubscribeData: Codable {
    let email: String
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
      .map { key, value in (key, value.0)}
      .sorted { first, second in first.0 > second.0 }

    return layout(
      title: "home",
      content: homePage(posts),
      backButton: false
    )
  case .photoGuessrAppStore:
    return request.fileio.streamFile(at: "Public/photoguessr-appstore.html")
  case let .posts(route):
    return try await postsHandler(
      request: request,
      route: route
    )
  case .privacyPolicy:
    return layout(
      title: "privacy policy",
      content: privacyPolicy()
    )
  case .subscribe:
    @Dependency(\.mail) var mail
    if request.method == .POST {
      let formData = try request.content.decode(SiteRoute.SubscribeData.self)
      do {
        try await mail.client.addContact(contact: .init(email: formData.email))
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
        title: post.0,
        content: .raw(post.1)
      )
    } else {
      request.logger.debug(.init(stringLiteral: "no post for \(id), \(url)"))
      throw Abort(.notFound)
    }
  }
}
