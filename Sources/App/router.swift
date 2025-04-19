import Vapor
@preconcurrency import VaporRouting

enum SiteRouterKey: StorageKey {
  typealias Value = AnyParserPrinter<URLRequestData, SiteRoute>
}

extension Application {
  var router: SiteRouterKey.Value {
    get { self.storage[SiteRouterKey.self]!}
    set { self.storage[SiteRouterKey.self] = newValue }
  }
}

let router = OneOf {
  Route(.case(SiteRoute.home))
  Route(.case(SiteRoute.photoGuessrAppStore)) {
    Path { "photoguessr-appstore" }
  }
  Route(.case(SiteRoute.posts)) {
    Path { "posts" }
    postsRouter
  }
}

let postsRouter = OneOf {
  Route(.case(PostsRoute.post)) {
    Path { Digits() }
  }
}

enum SiteRoute {
  case home
  case photoGuessrAppStore
  case posts(PostsRoute)
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
    let posts = posts.map { key, value in (key, value.0)}
    return layout(
      title: "home",
      content: homePage(
        posts: posts,
        urlForPostId: { id in request.application.router.url(for: .posts(.post(id))) }
      )
    )
  case .photoGuessrAppStore:
    return request.fileio.streamFile(at: "Public/photoguessr-appstore.html")
  case let .posts(route):
    return try await postsHandler(request: request, route: route)
  }
}

func postsHandler(
  request: Request,
  route: PostsRoute
) async throws -> AsyncResponseEncodable {
  switch route {
  case let .post(id):
    let url = request.application.router
      .url(for: .posts(.post(id)))
    let home = request.application.router
      .url(for: .home)

    if let post = posts[id] {
      return postLayout(
        title: post.0,
        content: .raw(post.1),
        backLink: home
      )
    } else {
      request.logger.debug(.init(stringLiteral: "no post for \(id), \(url)"))
      throw Abort(.notFound)
    }
  }
}
