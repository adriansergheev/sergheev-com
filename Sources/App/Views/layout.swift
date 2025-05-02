import Foundation
import Dependencies
import HtmlVaporSupport

public func layout(
  title: String,
  content: Node,
  backButton: Bool = true
) -> Node {
  @Dependency(\.siteRouter) var router
  let footer = Node.footer(
    .a(
      attributes: [.href(router.url(for: .home).absoluteString), .class("back-button")],
      "← Back to Homepage"
    )
  )
  return [
    .doctype,
    .html(
      .head(
        .title(title),
        .style(safe: indexCSS),
        .meta(viewport: .width(.deviceWidth), .initialScale(1)),
        .script(attributes: [
          .defer(true),
          .data("domain", "sergheev.com"),
          .src("https://plausible.sergheev.com/js/script.js")
        ])
      ),
      .body(
        .main(content),
        backButton
        ? footer
        : Node()
      )
    )
  ]
}
