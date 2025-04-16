import Foundation
import HtmlVaporSupport

public func layout(
  title: String,
  content: Node,
  footer: Node = [],
) -> Node {
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
        footer
      )
    )
  ]
}

public func postLayout(
  title: String,
  content: Node,
  backLink: URL,
) -> Node {
  layout(
    title: title,
    content: content,
    footer: [
      .footer(
        .a(
          attributes: [.href(backLink.absoluteString),.target(.blank), .class("back-button")],
          "← Back to Homepage"
        )
      )
    ]
  )
}
