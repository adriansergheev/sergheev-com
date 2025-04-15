import Foundation
import PackagePlugin

@main
struct GenerateSwiftMarkdown: CommandPlugin {
  func performCommand(context: PackagePlugin.PluginContext, arguments: [String]) async throws {
    let fileManager = FileManager.default

    let inputDirectory = context.package.directory
      .appending(["Sources", "App", "Posts"]).string
    let executable = context.package.directory
      .appending(["Plugins", "GenerateSwiftMarkdown", "ink"]).string
    let markdownFiles = try fileManager.contentsOfDirectory(atPath: inputDirectory)
      .filter { $0.hasSuffix(".md") }

    Diagnostics.emit(.remark, "🟢 input directory: \(inputDirectory)")
    Diagnostics.emit(.remark, "🟢 executable path: \(executable)")
    Diagnostics.emit(.remark, "🟢 markdown files: \(markdownFiles)")

    for markdownFile in markdownFiles {
      let inputFilePath = URL(fileURLWithPath: inputDirectory).appendingPathComponent(markdownFile).path

      let process = Process()
      process.executableURL = URL(fileURLWithPath: executable)
      process.arguments = [inputFilePath]

      let outputPipe = Pipe()
      process.standardOutput = outputPipe

      try process.run()
      process.waitUntilExit()

      guard let outputData = try outputPipe.fileHandleForReading.readToEnd(),
            let output = String(data: outputData, encoding: .utf8)
      else {
        Diagnostics.emit(.error, "🔴 GenerateSwiftMarkdown failed")
        return
      }

      let variableName = markdownFile.replacingOccurrences(of: ".md", with: "")
      let swiftContent = """
          // Auto-generated from \(markdownFile)
          let post\(variableName.replacingOccurrences(of: "-", with: "")): String =
          \"\"\"
          
          \(output)
          \"\"\"
          """

      let outputFilePath = URL(fileURLWithPath: inputDirectory)
        .appendingPathComponent("\(variableName).swift")
        .path

      try swiftContent.write(toFile: outputFilePath, atomically: true, encoding: .utf8)
      Diagnostics.emit(.remark, "🟢 Generated \(variableName).swift")
    }
  }
}
