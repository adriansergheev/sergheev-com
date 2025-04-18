import Foundation
import PackagePlugin

@main
struct MarkdownHTML: BuildToolPlugin {
  func createBuildCommands(
    context: PackagePlugin.PluginContext,
    target: any PackagePlugin.Target
  ) async throws -> [PackagePlugin.Command] {
    enum MarkdownHTMLError: Error {
      case failedToReadInputDirectory
    }
    guard let target = target as? SourceModuleTarget else {
      Diagnostics.emit(.error, "🔴 GenerateSwiftMarkdown failed")
      throw MarkdownHTMLError.failedToReadInputDirectory
    }
    return try target.sourceFiles(withSuffix: "md").map { file in
      let base = file.url.deletingPathExtension().lastPathComponent
      let input = file.url
      let output = context.pluginWorkDirectoryURL.appending(path: "\(base).swift")

      return .buildCommand(
        displayName: "Generating HTML from Markdown \(base)",
        executable: try context.tool(named: "MarkdownHTMLExec").url,
        arguments: [input.path, output.path],
        inputFiles: [input],
        outputFiles: [output]
      )
    }
  }
}
