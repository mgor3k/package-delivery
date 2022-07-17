import Foundation

public struct Delivery: Equatable {
  public let id: String
  public let currentLocation: Coordinates
  public let deliveryLocation: Coordinates
  public let location: String // TODO: To be removed
  public let deliveryDate: Date
  public let status: Status
  
  public init(
    id: String,
    currentLocation: Coordinates,
    deliveryLocation: Coordinates,
    location: String,
    deliveryDate: Date,
    status: Status
  ) {
    self.id = id
    self.currentLocation = currentLocation
    self.deliveryLocation = deliveryLocation
    self.location = location
    self.deliveryDate = deliveryDate
    self.status = status
  }
}

public extension Delivery {
  enum Status: Equatable {
    case packing, sent, completed
  }
  
  struct Coordinates: Equatable {
    public let latitude: Double
    public let longitude: Double
  }
}

#if DEBUG
public extension Delivery {
  static func preview() -> Delivery {
    .init(
      id: "test",
      currentLocation: .init(latitude: 20, longitude: 20),
      deliveryLocation: .init(latitude: 30, longitude: 30),
      location: "some location",
      deliveryDate: .now,
      status: .sent
    )
  }
}
#endif
