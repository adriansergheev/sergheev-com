import Vapor

func feedFetch(_ request: Request) {
  guard request.application.environment == .production else { return }
  let userAgent = request.headers.first(name: .userAgent) ?? ""
  let ip = request.headers.first(name: "CF-Connecting-IP") ?? request.peerAddress?.ipAddress ?? ""
  let client = request.application.client
  let logger = request.logger
  Task {
    do {
      let response = try await client.post("https://plausible.sergheev.com/api/event") { req in
        req.headers.replaceOrAdd(name: .userAgent, value: userAgent)
        req.headers.replaceOrAdd(name: .xForwardedFor, value: ip)
        try req.content.encode(PlausibleEvent.feedFetch(userAgent: userAgent))
      }
      if response.status != .accepted {
        logger.warning("Plausible rejected feed fetch event: \(response.status)")
      }
    } catch {
      logger.warning("Feed fetch event failed: \(error)")
    }
  }
}

struct PlausibleEvent: Content {
  var name: String
  var url: String
  var domain: String
  var props: [String: String]

  static func feedFetch(userAgent: String) -> Self {
    var props = ["reader": feedReader(fromUserAgent: userAgent)]
    if let match = userAgent.firstMatch(of: /(\d+) subscribers?/) {
      props["subscribers"] = String(match.1)
    }
    return Self(
      name: "RSS Fetch",
      url: "https://www.sergheev.com/rss.xml",
      domain: "sergheev.com",
      props: props
    )
  }
}

func feedReader(fromUserAgent userAgent: String) -> String {
  if let match = userAgent.firstMatch(of: /compatible; ([^\/;)]+)/) {
    return String(match.1)
  }
  let product = userAgent.prefix { $0 != "/" && $0 != " " }
  switch product {
  case "": return "Unknown"
  case "Mozilla": return "Browser"
  default: return String(product)
  }
}
