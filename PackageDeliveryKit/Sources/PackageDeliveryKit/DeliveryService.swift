import Foundation

public struct DeliveryService {
  let getDeliveries: () async throws -> [Delivery]
}

public extension DeliveryService {
  static func live(delay: UInt64 = 1) -> Self {
    .init(
      getDeliveries: {
        try await Task.sleep(nanoseconds: NSEC_PER_SEC * delay)
        return [
          .init(
            id: "1",
            currentLocation: .init(latitude: 50.061171, longitude: 19.968867),
            deliveryLocation: .init(latitude: 50.059091, longitude: 19.976023),
            location: "7a, Boston",
            deliveryDate: .now + 1,
            status: .sent
          )
        ]
      }
    )
  }
}

#if DEBUG
extension DeliveryService {
  static func preview(deliveries: [Delivery] = []) -> Self {
    .init(getDeliveries: {
      deliveries
    })
  }
}
#endif
