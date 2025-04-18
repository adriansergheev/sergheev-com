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
      let base = file.path.stem
      let input = file.path
      let output = context.pluginWorkDirectory.appending(["\(base).swift"])

      return .buildCommand(
        displayName: "Generating HTML from Markdown \(base)",
        executable: try context.tool(named: "MarkdownHTMLExec").path,
        arguments: [input.string, output.string],
        inputFiles: [input],
        outputFiles: [output]
      )
    }
  }
}
