import Vapor
@preconcurrency import VaporRouting

public func configure(_ app: Vapor.Application) async throws {
  app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
  try routes(app)
}

func routes(_ app: Vapor.Application) throws {
  app.mount(router, use: siteHandler)
}

let router = OneOf {
  Route(.case(SiteRoute.home))
  Route(.case(SiteRoute.photoGuessrAppStore))
}

enum SiteRoute {
  case home
  case photoGuessrAppStore
}

func siteHandler(
  request: Request,
  route: SiteRoute
) async throws -> AsyncResponseEncodable {
  switch route {
  case .home:
    return layout(title: "home", content: homePage)
  case .photoGuessrAppStore:
    return request.fileio.streamFile(at: "Public/photoguessr-appstore.html")
  }
  //  app.get("images", ":imageName") { req async in
  //    guard let imageName = req.parameters.get("imageName")
  //    else { return Response.init(status: .notFound) }
  //    return req.fileio.streamFile(at: app.directory.publicDirectory + "images/" + imageName)
  //  }
}

