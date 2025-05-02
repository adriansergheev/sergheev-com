import Foundation
import HtmlVaporSupport
import Dependencies

public func subscribe() -> Node {
  @Dependency(\.siteRouter) var router
  return [
    .h2("Subscribe for email alerts"),
    .section(
      attributes: [.class("subscribe")],
      .form(
        attributes: [
          .action(router.path(for: .subscribe)),
          .method(.post)
        ],
        .input(
          attributes: [
            .type(.email),
            .id("email"),
            .name("email"),
            .placeholder("Enter your email"),
            .required(true)
          ]
        ),
        .input(
          attributes: [
            .type(.submit),
            .value("Subscribe")
          ]
        ),
        .br,
        .a(
          attributes: [
            .class("privacy-link"),
            .href(router.url(for: .privacyPolicy).absoluteString),
            .target(.blank), .class("inline-link")
          ],
          "Privacy Policy"
        )
      )
    )
  ]
}
