import Vapor
import HtmlVaporSupport

// configures your application
public func configure(_ app: Vapor.Application) async throws {
	app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
	// register routes
	try routes(app)
}

func routes(_ app: Vapor.Application) throws {
	app.get { req async in
		layout(title: "home", content: homePage)
	}
	app.get("photoguessr-appstore") { req async in
		req.fileio.streamFile(at: "Public/photoguessr-appstore.html")
	}
	//	app.get("images", ":imageName") { req async in
	//		guard let imageName = req.parameters.get("imageName")
	//		else { return Response.init(status: .notFound) }
	//		return req.fileio.streamFile(at: app.directory.publicDirectory + "images/" + imageName)
	//	}
}
