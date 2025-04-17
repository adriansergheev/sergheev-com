import Foundation

let fileManager = FileManager.default
let arguments = ProcessInfo().arguments
let (input, output) = (arguments[1], arguments[2])
let thirdPartyExecutablePath = arguments[3]

let process = Process()
process.executableURL = URL(fileURLWithPath: thirdPartyExecutablePath)
process.arguments = [input]
let outputPipe = Pipe()
process.standardOutput = outputPipe
try process.run()
process.waitUntilExit()

enum MarkdownHTMLExec: Error {
  case failedToReadOutput
  case failedToExtractVariableName
}

guard let outputData = try outputPipe.fileHandleForReading.readToEnd(),
      let outputString = String(data: outputData, encoding: .utf8)
else { throw MarkdownHTMLExec.failedToReadOutput }

guard let variableName = input
  .replacingOccurrences(of: ".md", with: "")
  .components(separatedBy: "/")
  .last
else { throw MarkdownHTMLExec.failedToExtractVariableName }

let swiftContent = """
      // Auto-generated from \(input)
      extension Posts {
        static let post\(variableName.replacingOccurrences(of: "-", with: "")): String =
        \"\"\"

        \(outputString)
        \"\"\"
      }
      """
try swiftContent.write(toFile: output, atomically: true, encoding: .utf8)
