import Foundation

public struct Delivery: Equatable {
  public let id: String
  public let currentLocation: Coordinates
  public let deliveryLocation: Coordinates
  
  public let deliveryLocationName: String
  
  public let deliveryDate: Date
  public let status: Status
  
  public let driverContact: Contact
  
  public init(
    id: String,
    currentLocation: Coordinates,
    deliveryLocation: Coordinates,
    deliveryLocationName: String,
    deliveryDate: Date,
    status: Status,
    driverContact: Contact
  ) {
    self.id = id
    self.currentLocation = currentLocation
    self.deliveryLocation = deliveryLocation
    self.deliveryLocationName = deliveryLocationName
    self.deliveryDate = deliveryDate
    self.status = status
    self.driverContact = driverContact
  }
}

public extension Delivery {
  enum Status: Equatable {
    case packing, sent, completed
  }
}

#if DEBUG
public extension Delivery {
  static func preview() -> Delivery {
    .init(
      id: "test",
      currentLocation: .init(latitude: 20, longitude: 20),
      deliveryLocation: .init(latitude: 30, longitude: 30),
      deliveryLocationName: "some location",
      deliveryDate: .now,
      status: .sent,
      driverContact: .init(name: "name", phoneNumber: "number", avatarUrl: .init(string: "https://i.pravatar.cc/55")!)
    )
  }
}
#endif
