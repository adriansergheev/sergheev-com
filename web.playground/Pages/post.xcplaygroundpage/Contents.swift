import PlaygroundSupport
import WebKit
import App
import Html

let post = Html.render(layout(title: "post", content: .raw(Posts.post20250416.content)))
let webView = WKWebView(frame: .init(x: 0, y: 0, width: 832, height: 750))
webView.loadHTMLString(post.description, baseURL: nil)
print(post)

PlaygroundPage.current.liveView = webView
