import Foundation

public struct Card: Equatable {
  public let type: Type
  public let number: String
}

public extension Card {
  enum `Type` {
    case visa, mastercard
  }
}
