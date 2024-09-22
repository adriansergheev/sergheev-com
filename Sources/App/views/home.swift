import HtmlVaporSupport

let homePage: Node = [
  .div(
    attributes: [.class("box")],
    .h1("Hey"),
    .div(attributes: [.class("divider")]),
    .p(
      "I’m Adrian and I live in Stockholm.",
      .br,
      "I write code for a living with my focus being on Apple platforms.",
      .br,
      "Are you currently in Stockholm? ",
      .a(attributes: [.href("https://cal.com/sergheev/15min"), .target(.blank), .class("inline-link")], "Let’s grab a coffee!"),
      .br
    ),
    .div(attributes: [.class("divider")]),
    .a(attributes: [.href("mailto:contact@sergheev.com")], "contact@sergheev.com"),
    .a(attributes: [.href("https://www.linkedin.com/in/sergheevadrian/"), .target(.blank), .class("link")], "LinkedIn"),
    .a(attributes: [.href("https://github.com/adriansergheev"), .target(.blank), .class("link")], "GitHub"),
    .a(attributes: [.href("https://x.com/adriansergheev"), .target(.blank)], "Twitter")
  )
]
