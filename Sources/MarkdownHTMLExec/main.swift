import Foundation
import Ink

enum MarkdownHTMLExec: Error {
  case failedToExtractVariableName
  case insufficientArguments
}

let fileManager = FileManager.default
let arguments = ProcessInfo.processInfo.arguments
if arguments.count < 3 {
  throw MarkdownHTMLExec.insufficientArguments
}
let (input, output) = (arguments[1], arguments[2])

let markdown = try String(contentsOfFile: input)
let parser = MarkdownParser()
let html = parser.html(from: markdown)

guard let postIdString = input
  .replacingOccurrences(of: ".md", with: "")
  .replacingOccurrences(of: "-", with: "")
  .components(separatedBy: "/")
  .last
else { throw MarkdownHTMLExec.failedToExtractVariableName }

// N.B: converts ids which can be converted to integers, ignores everything else
if let postId = Int(postIdString) {
  let swiftContent = """
      // Auto-generated from \(postId).md
      extension Posts {
        public static let post\(postId) = Post(id: \(postId), content:
        \"\"\"

        \(html)
        \"\"\"
        )
      }
      """
  try swiftContent.write(toFile: output, atomically: true, encoding: String.Encoding.utf8)
}
