import PlaygroundSupport
import WebKit
import App
import Html

public let firstPost: Node = [
  //TODO: figure out how to convert "2025-04-13.md" to this string, ideally at compile time. Macros? Plugins?
  .raw("""
    <h1>Blog Post</h1><p><em>Date: YYYY-MM-DD | Author: Your Name</em></p><hr><h2>Introduction</h2><p>Introduction</p><h2>Content</h2><p>Content</p><pre><code class="language-language">// Example snippet
    print("Hello, World!")</code></pre>
    """)
]

let post = Html.render(layout(title: "post", content: firstPost))
let webView = WKWebView(frame: .init(x: 0, y: 0, width: 832, height: 750))
webView.loadHTMLString(post.description, baseURL: nil)
print(post)

PlaygroundPage.current.liveView = webView
