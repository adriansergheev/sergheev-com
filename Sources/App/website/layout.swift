import HtmlVaporSupport

func layout(title: String, content: Node) -> Node {
	return [
		.doctype,
		.html(
			.head(
				.title(title),
				// include inline stylesheets
				.style(safe: stylesheet),
				// plausible analytics
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

let footer: Node = [
	.hr,
	.footer("© 2024 Adrian Sergheev")
]
