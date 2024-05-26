import HtmlVaporSupport

public func layout(title: String, content: Node) -> Node {
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
				.main(content)
//				footer
			)
		)
	]
}

//let footer: Node = [
//	.footer(
//		"© 2024",
//	)
//]
