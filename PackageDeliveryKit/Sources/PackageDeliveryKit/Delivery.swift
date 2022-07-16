import Foundation

public struct Delivery: Equatable {
  public let id: String
  public let location: String
  public let deliveryDate: Date
  public let status: Status
  
  public init(
    id: String,
    location: String,
    deliveryDate: Date,
    status: Status
  ) {
    self.id = id
    self.location = location
    self.deliveryDate = deliveryDate
    self.status = status
  }
}

public extension Delivery {
  enum Status {
    case packing, sent, completed
  }
}

#if DEBUG
public extension Delivery {
  static func preview() -> Delivery {
    .init(
      id: "test",
      location: "some location",
      deliveryDate: .now,
      status: .sent
    )
  }
}
#endif
