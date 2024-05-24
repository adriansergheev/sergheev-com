import HtmlVaporSupport

public let homePage: Node = [
	.h1(attributes: [.class("greeting")], "Adrian Sergheev"),
	.p("I am a software developer living in Stockholm, Sweden."),
	.br,
	.p("Here are some of the apps I have worked on:"),
	.ul(
		attributes: [.class("work")],
		[
			.li(
				.a(attributes: [.href("https://sergheev.com/photoguessr-appstore/")],
					 .img(
						src: "images/photoguessr.png",
						alt: "Photoguessr",
						attributes: [.title("Photoguessr")]
					 )
				)
			),
			.li(
				.a(attributes: [.href("https://apps.apple.com/fi/app/tori-fi/id505943449")],
					 .img(
						src: "images/tori.png",
						alt: "Tori",
						attributes: [.class("icon-ios"), .title("Tori")]
					 )
				)
			),
			.li(
				.a(attributes: [.href("https://apps.apple.com/us/app/finn-no/id526541908")],
					 .img(
						src: "images/finn.png",
						alt: "Finn",
						attributes: [.class("icon-ios"), .title("Finn")]
					 )
				)
			),
			.li(
				.a(attributes: [.href("https://apps.apple.com/se/app/blocket-köp-sälj-begagnat/id323710525")],
					 .img(
						src: "images/blocket.png",
						alt: "Blocket",
						attributes: [.class("icon-ios"), .title("Blocket")]
					 )
				)
			),
			.li(
				.a(attributes: [.href("https://apps.apple.com/se/app/länsförsäkringar/id426706646")],
					 .img(
						src: "images/lf.png",
						alt: "Länsförsäkringar",
						attributes: [.class("icon-ios"), .title("Länsförsäkringar")]
					 )
				)
			),
			.li(
				.a(attributes: [.href("https://apps.apple.com/se/app/quipower/id1427309068")],
					 .img(
						src: "images/enequi.png",
						alt: "Enequi",
						attributes: [.class("icon-ios"), .title("Enequi")]
					 )
				)
			)
		]
	),
	.p("And here are some talks I have given:"),
	.ul(attributes: [.class("ul")], [
		.li([
			.div([
				.a(attributes: [.href("https://www.youtube.com/watch?v=rYC-TnKoi40")], "Intro to Swift (for functional programmers)"),
				" for ",
				.a(attributes: [.href("https://www.meetup.com/Func-Prog-Sweden/")], "Func Prog Sweden"),
				" (June 2023)"
			])
		]),
		.li([
			.div([
				.a(attributes: [.href("https://github.com/adriansergheev/modularisation-cocoaheads-2023")], "Modularisation on iOS"),
				" for ",
				.a(attributes: [.href("https://www.cocoaheadssthlm.org")], "CocoaHeads Stockholm"),
				" (May 2023)"
			])
		])
	]
	),
	.br,
	.p(
		[
			"I might be ",
			.a(attributes: [.href("https://cal.com/sergheev/15min")], "available"),
			" to help out with your ideas. You can also find me on ",
			.a(attributes: [.href("https://github.com/adriansergheev")], "GitHub"),
			", ",
			.a(attributes: [.href("https://x.com/adriansergheev")], "Twitter"),
			" or ",
			.a(attributes: [.href("mailto:contact@sergheev.com")], "Email"),
			"."
		]
	)
]
