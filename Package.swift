// swift-tools-version:5.10
import PackageDescription

let package = Package(
	name: "sergheev",
	platforms: [
		.macOS(.v13)
	],
	products: [
		.library(name: "App", targets: ["App"]),
	],
	dependencies: [
		.package(url: "https://github.com/vapor/vapor.git", from: "4.99.3"),
		.package(url: "https://github.com/apple/swift-nio.git", from: "2.65.0"),
		.package(url: "https://github.com/adriansergheev/swift-html-vapor.git", revision: "f0eb9d7")
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
				.product(name: "HtmlVaporSupport", package: "swift-html-vapor")
			],
			swiftSettings: swiftSettings
		),
		.testTarget(
			name: "AppTests",
			dependencies: [
				.target(name: "App"),
				.product(name: "XCTVapor", package: "vapor"),
			],
			swiftSettings: swiftSettings
		)
	]
)

var swiftSettings: [SwiftSetting] { [
	.enableUpcomingFeature("DisableOutwardActorInference"),
	.enableExperimentalFeature("StrictConcurrency"),
] }
