import Foundation
import HtmlVaporSupport

public func subscribe() -> Node {
  return [
    .form(
      attributes: [
        .action("/subscribe"),
        .method(.post)
      ],
      .div(
        .label(attributes: [.for("email")], "Subscribe for email alerts"),
        .br,
        .input(
          attributes: [
            .type(.email),
            .id("email"),
            .name("email"),
            .placeholder("Enter your email"),
            .required(true)
          ]
        ),
        .br,
        .input(
          attributes: [
            .type(.submit),
            .value("Subscribe")
          ]
        ),
        .br
      )
    )
  ]
}
