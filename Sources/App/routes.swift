import Vapor
import HtmlVaporSupport

// configures your application
public func configure(_ app: Vapor.Application) async throws {
	// uncomment to serve files from /Public folder
	// app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
	// register routes
	try routes(app)
}

func routes(_ app: Vapor.Application) throws {
	app.get { req async in
		layout(title: "home", content: homepage)
	}
	app.get("photoguessr-appstore") { req async in
		req.fileio.streamFile(at: "Public/photoguessr-appstore.html")
	}
}
