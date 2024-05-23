import Vapor
import HtmlVaporSupport

func routes(_ app: Vapor.Application) throws {
	app.get { req async in
		req.fileio.streamFile(at: "Public/index.html")
	}
	//	app.get { req async in
	//		return Node.h1("Hello, type-safe HTML on Vapor!")
	//	}
	app.get("photoguessr-appstore") { req async in
		req.fileio.streamFile(at: "Public/photoguessr-appstore.html")
	}
}
