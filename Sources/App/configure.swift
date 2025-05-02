import Vapor
@preconcurrency import VaporRouting
import Dependencies

enum SiteRouterKey: StorageKey {
  typealias Value = AnyParserPrinter<URLRequestData, SiteRoute>
}
extension Application {
  var router: SiteRouterKey.Value {
    get { self.storage[SiteRouterKey.self]!}
    set { self.storage[SiteRouterKey.self] = newValue }
  }
}
public func configure(_ app: Vapor.Application) async throws {
  @Dependency(\.siteRouter) var siteRouter
  app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
  var baseURL: String {
    switch app.environment {
    case .development, .testing:
      "http://localhost:8080"
    default:
      "https://www.sergheev.com"
    }
  }
  app.router = siteRouter
    .baseURL(baseURL)
    .eraseToAnyParserPrinter()
  app.mount(siteRouter, use: siteHandler)
}
