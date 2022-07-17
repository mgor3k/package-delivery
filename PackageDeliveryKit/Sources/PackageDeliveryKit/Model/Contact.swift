import Foundation

public struct Contact: Equatable {
  public let name: String
  public let phoneNumber: String
  public let avatarUrl: URL
}

#if DEBUG
public extension Contact {
  static var preview: Self {
    .init(
      name: "John Doe",
      phoneNumber: "111-111-111",
      avatarUrl: .init(string: "https://i.pravatar.cc/55")!
    )
  }
}
#endif
