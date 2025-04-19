import PlaygroundSupport
import WebKit
import App
import Html

let homeString = Html.render(
  layout(
    title: "home",
    content: homePage(
      posts: [],
      urlForPostId: { _ in URL(string: "")! }
    )
  )
)
let webView = WKWebView(frame: .init(x: 0, y: 0, width: 832, height: 750))
webView.loadHTMLString(homeString.description, baseURL: nil)
print(homeString)

PlaygroundPage.current.liveView = webView
