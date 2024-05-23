import HtmlVaporSupport

let home: Node = [
	.div(
		attributes: [.class("box")],
		.h1("Adrian Sergheev"),
		.div(attributes: [.class("divider")]),
		.p(.a(attributes: [.href("mailto:contact@sergheev.com")], "contact@sergheev.com")),
		.a(attributes: [.href("https://github.com/adriansergheev"), .target(.blank)], "GitHub"),
		.a(attributes: [.href("https://x.com/adriansergheev"), .target(.blank)], "Twitter")
	)
]
