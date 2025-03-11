import Vapor
@preconcurrency import VaporRouting

let router = OneOf {
  Route(.case(SiteRoute.home))
  Route(.case(SiteRoute.photoGuessrAppStore))
}

enum SiteRouterKey: StorageKey {
  typealias Value = AnyParserPrinter<URLRequestData, SiteRoute>
}

extension Application {
  var router: SiteRouterKey.Value {
    get {
      self.storage[SiteRouterKey.self]!
    }
    set {
      self.storage[SiteRouterKey.self] = newValue
    }
  }
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

