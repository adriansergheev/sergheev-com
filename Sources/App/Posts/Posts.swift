public enum Posts {}
public typealias Post = (id: Int, content: String)

let posts: [Int: (String, String)] = [
  Posts.post20250416.id: ("Apr 16, 2025 - Playing Guitar in the Semantic Apocalypse", Posts.post20250416.content),
  Posts.post20250419.id: ("Apr 19, 2025 - A Rudimentary Blog in Swift with Build Tool Plugins", Posts.post20250419.content),
  Posts.post20260311.id: ("Mar 11, 2026 - Liminal: Private Skincare Routines (Open Beta)", Posts.post20260311.content)
]
