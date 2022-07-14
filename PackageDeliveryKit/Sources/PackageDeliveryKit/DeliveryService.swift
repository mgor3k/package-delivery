import Foundation

public struct DeliveryService {
  let getDeliveries: () async throws -> [Delivery]
}

public extension DeliveryService {
  static var live: Self {
    .init(
      getDeliveries: {
        try await Task.sleep(nanoseconds: NSEC_PER_SEC)
        return [.init(id: "1", location: "7a, Boston", deliveryDate: .now + 1)]
      }
    )
  }
}
