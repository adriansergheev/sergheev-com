import Vapor
@preconcurrency import VaporRouting

public func configure(_ app: Vapor.Application) async throws {
  app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
  var baseURL: String {
    switch app.environment {
    case .development, .testing:
      "http://localhost:8080"
    default:
      "https://www.sergheev.com:8080"
    }
  }
  app.router = router
    .baseURL(baseURL)
    .eraseToAnyParserPrinter()
  app.mount(router, use: siteHandler)
}

