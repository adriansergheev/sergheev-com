import Foundation
import Dependencies
import HtmlVaporSupport

public func layout(
  title: String,
  content: Node,
  backButton: Bool = true,
  usePrismJS: Bool = false
) -> Node {
  @Dependency(\.siteRouter) var router
  let backButtonNode = Node.header(
    attributes: [.class("site-header")],
    .a(
      attributes: [.href(router.url(for: .home).absoluteString), .class("back-button")],
      "← Back to Homepage"
    )
  )
  let footer = Node.footer(
    attributes: [.class("site-footer")],
    .p(
      .a(
        attributes: [.href(router.url(for: .subscribe).absoluteString)],
        "Subscribe"
      ),
      " for email alerts about new posts."
    )
  )
  return [
    .doctype,
    .html(
      .head(
        .title(title),
        .style(unsafe: style(usePrismJS: usePrismJS)),
        .meta(viewport: .width(.deviceWidth), .initialScale(1)),
        .link(attributes: [.rel(.init(rawValue: "preconnect")), .href("https://fonts.googleapis.com")]),
        .link(attributes: [.rel(.init(rawValue: "preconnect")), .href("https://fonts.gstatic.com"), .init("crossorigin", "")]),
        .link(attributes: [
          .rel(.stylesheet),
          .href("https://fonts.googleapis.com/css2?family=Newsreader:ital,opsz,wght@0,6..72,400;0,6..72,500;1,6..72,400&family=Inter:wght@400;500&display=swap")
        ]),
        .script(attributes: [
          .defer(true),
          .data("domain", "sergheev.com"),
          .src("https://plausible.sergheev.com/js/script.js")
        ])
      ),
      .body(
        backButton ? backButtonNode : [],
        .main(content),
        backButton ? footer : [],
        usePrismJS ? prismJS() : []
      )
    )
  ]
}

public func style(usePrismJS: Bool) -> String {
  var style: String = ""
  style.append(contentsOf: String(describing: indexCSS))
  if usePrismJS {
    style.append(contentsOf: String(describing: syntaxCSS))
  }
  return style
}

// syntax highlighting
public func prismJS() -> Node {
  return [
    .script(attributes: [.src("//cdnjs.cloudflare.com/ajax/libs/prism/1.28.0/prism.min.js")]),
    .script(attributes: [.src("//cdnjs.cloudflare.com/ajax/libs/prism/1.28.0/plugins/line-highlight/prism-line-highlight.min.js")]),
    .script(attributes: [.src("//cdnjs.cloudflare.com/ajax/libs/prism/1.28.0/components/prism-swift.min.js")]),
    .script(safe:
      #"""
      Prism.languages.swift['class-name'] = [
        /\b(_[A-Z]\w*)\b/,
        Prism.languages.swift['class-name']
      ];
      Prism.languages.swift.keyword = [
        /\b(any|macro|sending)\b/,
        /\b((iOS|macOS|tvOS|watchOS|visionOS)(|ApplicationExtension)|swift)\b/,
        Prism.languages.swift.keyword
      ];
      Prism.languages.swift.comment.inside = {
        todo: {
          pattern: /(TODO:)/
        }
      };
      Prism.languages.insertBefore('swift', 'operator', {
        'code-fold': {
          pattern: /…/
        },
      });
      Prism.languages.insertBefore('swift', 'string-literal', {
        'placeholder': {
          pattern: /<#.+?#>/,
          inside: {
            'placeholder-open': {
              pattern: /<#/
            },
            'placeholder-close': {
              pattern: /#>/
            },
          }
        },
      });
      """#
           )
  ]
}
