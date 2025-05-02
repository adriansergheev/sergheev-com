import IndiePitcherSwift
import Dependencies
import Vapor

extension DependencyValues {
  var mail: MailClient {
    get { self[MailClient.self] }
    set { self[MailClient.self] = newValue }
  }
}

public struct MailClient: Sendable {
  let client: IndiePitcher = .init(apiKey: Environment.get("MAIL_API_KEY")!)
}

extension MailClient: DependencyKey {
  public static let liveValue = MailClient()
}
