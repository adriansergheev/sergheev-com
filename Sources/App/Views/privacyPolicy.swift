import Foundation
import HtmlVaporSupport

// https://www.darioamodei.com/privacy-policy
public func privacyPolicy() -> Node {
  .div(
    .h1("Privacy Policy"),
    .p(
      "I respect your privacy and aim to collect minimal personal information."
    ),
    .p(
      .strong("Analytics: "),
      "This site uses Plausible Analytics, a privacy-friendly tool that doesn't use cookies, to gather aggregated analytics which cannot identify you individually."
    ),
    .p(
      .strong("Email Collection: "),
      "If you want to receive notifications about new posts, you can share your email address. This is entirely optional, and you can unsubscribe at any time by using the opt out/unsubscribe link at the bottom of any notifications."
    ),
    .p(
      .strong("Purpose: "),
      "The aggregated analytics are used to understand website traffic. If you provide your email, it will be used solely to send you post notifications for this site."
    ),
    .p(
      .strong("Legal Basis: "),
      "The use of aggregated analytics is based on my legitimate interest to understand activity on the site (GDPR Article 6(1)(f)). Email collection and processing is based on your consent."
    ),
    .p(
      .strong("Data Sharing: "),
      "Your email address is not shared with third parties."
    ),
    .p(
      .strong("Data Retention: "),
      "If you provide your email, it's retained until you unsubscribe."
    ),
    .p(
      .strong("Your Rights: "),
      "You have the right to access, correct, or delete your email address from site records at any time."
    ),
    .p(
      "For more information about Plausible Analytics and their privacy practices, ",
      .a(
        attributes: [.href("https://plausible.io/privacy")],
        "visit their website"
      ),
      ". If you have any questions about this privacy notice or wish to contact me to exercise any of your rights, please reach out."
    )
  )
}
