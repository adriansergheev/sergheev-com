import Vapor

func routes(_ app: Application) throws {
    app.get { req async in
        req.fileio.streamFile(at: "Public/index.html") 
    }
}
