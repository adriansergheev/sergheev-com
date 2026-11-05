import Foundation
import Dependencies
@preconcurrency import VaporRouting

func rssFeed(router: AnyParserPrinter<URLRequestData, SiteRoute>) -> String {
  let home = router.url(for: .home).absoluteString
  let feed = router.url(for: .rss).absoluteString
  let items = posts
    .sorted { first, second in first.key > second.key }
    .map { id, post in
      let link = router.url(for: .posts(.post(id))).absoluteString
      return """
            <item>
              <title>\(xmlEscaped(post.title))</title>
              <link>\(link)</link>
              <guid isPermaLink="true">\(link)</guid>
              <pubDate>\(rfc822Date(forPostID: id))</pubDate>
              <description>\(xmlEscaped(absolutized(post.content, base: home)))</description>
            </item>
        """
    }
    .joined(separator: "\n")

  return """
    <?xml version="1.0" encoding="UTF-8"?>
    <rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom">
      <channel>
        <title>Adrian Sergheev</title>
        <link>\(home)</link>
        <description>Posts by Adrian Sergheev</description>
        <language>en</language>
        <atom:link href="\(feed)" rel="self" type="application/rss+xml"/>
    \(items)
      </channel>
    </rss>
    """
}

func rfc822Date(forPostID id: Int) -> String {
  @Dependency(\.calendar) var calendar
  guard let date = postDate(forPostID: id) else { return "" }
  let formatter = DateFormatter()
  formatter.locale = Locale(identifier: "en_US_POSIX")
  formatter.timeZone = calendar.timeZone
  formatter.dateFormat = "EEE, dd MMM yyyy HH:mm:ss Z"
  return formatter.string(from: date)
}

func absolutized(_ html: String, base: String) -> String {
  let origin = base.hasSuffix("/") ? String(base.dropLast()) : base
  return html.replacing(/(src|href)="\/(?!\/)/) { match in "\(match.1)=\"\(origin)/" }
}

func xmlEscaped(_ string: String) -> String {
  string
    .replacingOccurrences(of: "&", with: "&amp;")
    .replacingOccurrences(of: "<", with: "&lt;")
    .replacingOccurrences(of: ">", with: "&gt;")
    .replacingOccurrences(of: "\"", with: "&quot;")
    .replacingOccurrences(of: "'", with: "&apos;")
}
