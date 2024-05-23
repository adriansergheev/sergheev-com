import Vapor
import HtmlVaporSupport

func routes(_ app: Vapor.Application) throws {
	app.get { req async in
		layout(title: "home", content: home)
	}
	app.get("photoguessr-appstore") { req async in
		req.fileio.streamFile(at: "Public/photoguessr-appstore.html")
	}
}
