import Foundation
import PackagePlugin

@main
struct GenerateSwiftMarkdown: CommandPlugin {
  func performCommand(context: PackagePlugin.PluginContext, arguments: [String]) async throws {
    let process = Process()
    //TODO: fix path
    process.executableURL = URL(fileURLWithPath: "/Users/sergheev/Desktop/dev/all/sergheev-com/sergheev-com/Plugins/GenerateSwiftMarkdown/ink")
    let fileName = "file"
    let path = "/Users/sergheev/Desktop/dev/all/sergheev-com/sergheev-com/Plugins/GenerateSwiftMarkdown/\(fileName).md"
    process.arguments = [path]

    let outputPipe = Pipe()
    process.standardOutput = outputPipe
    try process.run()
    process.waitUntilExit()

    let outputData = try outputPipe.fileHandleForReading.readToEnd()!
    let output = String(data: outputData, encoding: .utf8)!


    let swiftFile: String = """
    // generated
    let \(fileName): String = 
    \"\"\"
    
    \(output)
    \"\"\"
    """
    try swiftFile.write(toFile: "\(fileName).swift", atomically: true, encoding: .utf8)
  }
}
