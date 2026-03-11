public enum Posts {}
public typealias Post = (id: Int, content: String)

struct PostInfo {
  let title: String
  let content: String
}

let posts: [Int: PostInfo] = [
  Posts.post20250416.id: PostInfo(title: "Playing Guitar in the Semantic Apocalypse", content: Posts.post20250416.content),
  Posts.post20250419.id: PostInfo(title: "A Rudimentary Blog in Swift with Build Tool Plugins", content: Posts.post20250419.content),
  Posts.post20260311.id: PostInfo(title: "Liminal: Private Skincare Routines (Open Beta)", content: Posts.post20260311.content)
]
