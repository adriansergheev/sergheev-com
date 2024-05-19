import Vapor

func routes(_ app: Application) throws {
    app.get { req async in
        req.fileio.streamFile(at: "Public/index.html") 
    }
    app.get("photoguessr-appstore") { req async in
        req.fileio.streamFile(at: "Public/photoguessr-appstore.html")
    }
    app.get("docker") { req in
        "docker" 
    }
}