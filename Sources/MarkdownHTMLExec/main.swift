import Foundation
import Ink

let fileManager = FileManager.default
let arguments = ProcessInfo().arguments
let (input, output) = (arguments[1], arguments[2])

let markdown = try String(contentsOfFile: input)
let parser = MarkdownParser()
let html = parser.html(from: markdown)

enum MarkdownHTMLExec: Error {
  case failedToExtractVariableName
}

guard let postIdString = input
  .replacingOccurrences(of: ".md", with: "")
  .replacingOccurrences(of: "-", with: "")
  .components(separatedBy: "/")
  .last
else { throw MarkdownHTMLExec.failedToExtractVariableName }

// converts files with names which can be converted to an integer
// ignores other files
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
  try swiftContent.write(toFile: output, atomically: true, encoding: .utf8)
}
