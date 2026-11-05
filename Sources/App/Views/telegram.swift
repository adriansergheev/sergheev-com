import Dependencies
import Vapor

extension DependencyValues {
  var telegram: TelegramClient {
    get { self[TelegramClient.self] }
    set { self[TelegramClient.self] = newValue }
  }
}

public struct TelegramClient: Sendable {
  let token = Environment.get("TELEGRAM_BOT_TOKEN")
  let chatID = Environment.get("TELEGRAM_CHAT_ID")

  func send(_ text: String, using client: Client) async throws {
    guard let token, let chatID else {
      throw Abort(.internalServerError, reason: "TELEGRAM_BOT_TOKEN or TELEGRAM_CHAT_ID is not set")
    }
    let response = try await client.post("https://api.telegram.org/bot\(token)/sendMessage") { req in
      try req.content.encode(["chat_id": chatID, "text": text])
    }
    guard response.status == .ok else {
      throw Abort(.badGateway, reason: "Telegram responded with \(response.status)")
    }
  }
}

extension TelegramClient: DependencyKey {
  public static let liveValue = TelegramClient()
}
