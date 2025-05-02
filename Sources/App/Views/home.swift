import Foundation
import HtmlVaporSupport
import Dependencies

public func homePage(_ posts: [(Int, String)]) -> Node {
  var postsNode: Node {
    let posts: Node = posts.map { post in
      @Dependency(\.siteRouter) var router
      let url = router.url(for: .posts(.post(post.0))).absoluteString
      return [Node.a(attributes: [.href(url), .target(.blank)], "\(post.1)"), .br]
    }.reduce(into: Node.fragment([])) { partialResult, node in
      switch partialResult {
      case var .fragment(previous):
        previous.append(contentsOf: node)
        partialResult = .fragment(previous)
      default: break
      }
    }
    if posts.isEmpty {
      return ""
    } else {
      return [
        "Posts:",
        .br,
        posts,
        .br
      ]
    }
  }
  return [
    .div(
      .h1("Adrian Sergheev"),
      .p(
        "I’m a developer at ",
        .a(attributes: [.href("https://sveasolar.se/sv-se"), .target(.blank), .class("inline-link")], "Svea Solar"),
        ", where I'm working on their iOS app.",
        .br,
        .br,
        "When I'm not writing code, I typically enjoy training ",
        .a(attributes: [.href("https://en.wikipedia.org/wiki/Brazilian_jiu-jitsu"), .target(.blank), .class("inline-link")], "BJJ"),
        ", walking around ",
        .a(attributes: [.href("https://sv.wikipedia.org/wiki/Stora_Nyckelviken"), .target(.blank), .class("inline-link")], "Nyckelviken"),
        ", or playing guitar.",
        .br,
        "Besides that, I'm interested in the ethical implications of AI. I also think people should have the choice to ",
        .a(attributes: [.href("https://en.wikipedia.org/wiki/Life_extension"), .target(.blank), .class("inline-link")], "live longer"),
        " if they wish to do so.",
        .br,
        .br,
        "Feel free to contact me at ",
        .a(attributes: [.href("mailto:contact@sergheev.com")], "contact@sergheev.com"),
        ", or on ",
        .a(attributes: [.href("https://x.com/adriansergheev"), .target(.blank)], "Twitter"),
        "."
      ),
      .div(attributes: [.class("divider")]),
      .p(
        postsNode,
        "Links:",
        .br,
        .a(attributes: [.href("https://github.com/adriansergheev/photoguessr"), .target(.blank)], "GeoGuessr - but for photos (Github)"),
        .br,
        .a(attributes: [.href("https://github.com/adriansergheev/eden"), .target(.blank)], "Messing around with ScreenTime api (Github)"),
        .br,
        .a(attributes: [.href("https://www.youtube.com/watch?v=rYC-TnKoi40"), .target(.blank)], "Intro to Swift (for functional programmers) (Youtube)"),
        .br
      )
    )
  ]
}
