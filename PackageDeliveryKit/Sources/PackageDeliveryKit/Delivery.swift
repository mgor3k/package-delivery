import Foundation

public struct Delivery: Equatable {
  let id: String
  public let location: String
  public let deliveryDate: Date
  
  public init(
    id: String,
    location: String,
    deliveryDate: Date
  ) {
    self.id = id
    self.location = location
    self.deliveryDate = deliveryDate
  }
}

#if DEBUG
public extension Delivery {
  static func preview() -> Delivery {
    .init(
      id: "test",
      location: "some location",
      deliveryDate: .now
    )
  }
}
#endif
