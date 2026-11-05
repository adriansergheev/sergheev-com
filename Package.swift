// swift-tools-version:6.0
import PackageDescription

let package = Package(
  name: "sergheev",
  platforms: [
    .macOS(.v13),
  ],
  products: [
    .library(name: "App", targets: ["App"]),
  ],
  dependencies: [
    .package(url: "https://github.com/vapor/vapor.git", from: "4.99.3"),
    .package(url: "https://github.com/apple/swift-nio.git", from: "2.65.0"),
    .package(url: "https://github.com/pointfreeco/swift-html-vapor", from: "0.5.0"),
    .package(url: "https://github.com/pointfreeco/vapor-routing", from: "0.1.3"),
    .package(url: "https://github.com/JohnSundell/Ink", exact: "0.6.0"),
    .package(url: "https://github.com/pointfreeco/swift-dependencies", from: "1.9.2")
  ],
  targets: [
    .executableTarget(
      name: "Run",
      dependencies: [
        "App"
      ]
    ),
    .target(
      name: "App",
      dependencies: [
        .product(name: "Vapor", package: "vapor"),
        .product(name: "NIOCore", package: "swift-nio"),
        .product(name: "NIOPosix", package: "swift-nio"),
        .product(name: "HtmlVaporSupport", package: "swift-html-vapor"),
        .product(name: "VaporRouting", package: "vapor-routing"),
        .product(name: "Dependencies", package: "swift-dependencies")
      ],
      plugins: ["MarkdownHTML"]
    ),
    .plugin(
      name: "MarkdownHTML",
      capability: .buildTool(),
      dependencies: ["MarkdownHTMLExec"]
    ),
    .executableTarget(
      name: "MarkdownHTMLExec",
      dependencies: [
        .product(name: "Ink", package: "Ink")
      ]
    ),
    .testTarget(
      name: "AppTests",
      dependencies: [
        .target(name: "App"),
        .product(name: "XCTVapor", package: "vapor"),
      ]
    )
  ]
)
