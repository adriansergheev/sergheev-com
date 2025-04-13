@preconcurrency import HtmlVaporSupport

public let homePage: Node = [
  .div(
    attributes: [.class("box")],
    .h1("Adrian Sergheev"),
    .p(
//      "I’m a developer at ",
//      .a(attributes: [.href("https://sveasolar.se/sv-se"), .target(.blank), .class("inline-link")], "Svea Solar"),
//      ", where I'm working on the iOS app.",
      "I’m a developer at ",
      .a(attributes: [.href("https://en.wikipedia.org/wiki/Schibsted"), .target(.blank), .class("inline-link")], "Schibsted Marketplaces"),
      ", where I'm working on one of the iOS apps.",
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
      "Links:",
      .br,
      .a(attributes: [.href("https://github.com/adriansergheev/photoguessr"), .target(.blank)], "GeoGuessr - but for photos (Github)"),
      .br,
      .a(attributes: [.href("https://github.com/adriansergheev/eden"), .target(.blank)], "Messing around with ScreenTime api (Github)"),
      .br,
      .a(attributes: [.href("https://www.youtube.com/watch?v=rYC-TnKoi40"), .target(.blank)], "Intro to Swift (for functional programmers) (Youtube)"),
      .br,
    )
  )
]
