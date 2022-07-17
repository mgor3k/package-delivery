import Foundation

public struct CardService {
  let getActiveCard: () async throws -> Card
}

public extension CardService {
  static func live(delay: UInt64 = 2) -> Self {
    .init(
      getActiveCard: {
        try await Task.sleep(nanoseconds: NSEC_PER_SEC * delay)
        return .init(type: .mastercard, number: "111122223333")
      }
    )
  }
}

#if DEBUG
extension CardService {
  static var preview: Self {
    .init(getActiveCard: { .init(type: .mastercard, number: "111122223333") })
  }
}
#endif
