public enum Posts {}
public typealias Post = (id: Int, content: String)

let posts: [Int: (String, String)] = [
  Posts.post20250416.id: ("Playing Guitar in the Semantic Apocalypse", Posts.post20250416.content),
  Posts.post20250419.id: ("A Rudimentary Blog in Swift with Build Tool Plugins", Posts.post20250419.content)
]
