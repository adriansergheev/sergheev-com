## [sergheev.com](https://sergheev.com)

This repository contains the full source code for [www.sergheev.com](https://sergheev.com)

The codebase is structured into three parts:

- `Sources`: Contains the executable server, layout, HTML and CSS, routing, etc.
- `Plugins`: Includes a [Swift Package Plugin](https://developer.apple.com/videos/play/wwdc2022/110359/) that runs `MarkdownHTMLExec` at build time.
- `MarkdownHTMLExec`: An executable that uses `Ink` to convert Markdown into HTML.

## Getting Started

With the project open in Xcode, you can:

- **Run the server locally**
  - Select the `Run` target
  - Press **Command + R**
  - Open [http://localhost:8080](http://localhost:8080)

- **Explore playgrounds**
  - Select the `App` target
  - Press **Command + B** to build
  - View the webpage in a [playground](https://github.com/adriansergheev/sergheev-com/tree/04987fa8f0e628b693c994fc39c80037c2331634/web.playground)

## Fun to Explore

- Similar to the [pointfree.co website](https://github.com/pointfreeco/pointfreeco), Xcode playgrounds are used for a fast feedback loop (when it works—thanks, Xcode 🙃).
- Type-safe and bi-directional routing.
- This repository serves as a practical example for creating [build tool plugins](https://github.com/adriansergheev/sergheev-com/blob/04987fa8f0e628b693c994fc39c80037c2331634/Plugins/MarkdownHTML/Plugin.swift) and [command tool plugins](https://github.com/adriansergheev/sergheev-com/blob/384375f410c835ddc492e394851f3c9b8ecdf1ba/Plugins/GenerateSwiftMarkdown/Plugin.swift).

### External Dependencies

- [Vapor (Web framework)](https://github.com/vapor/vapor)
- [pointfreeco swift-html (Type-safe HTML generation)](https://github.com/pointfreeco/swift-html)
- [vapor-routing (Type-safe routing)](https://github.com/pointfreeco/vapor-routing)
- [Ink (Markdown parser)](https://github.com/JohnSundell/Ink)

## License

[MIT](https://mit-license.org)
