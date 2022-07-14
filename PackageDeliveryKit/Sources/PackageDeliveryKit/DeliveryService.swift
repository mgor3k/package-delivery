import Foundation

public struct DeliveryService {
  let getDeliveries: () async throws -> [Delivery]
}

public extension DeliveryService {
  static func live(delay: UInt64 = 1) -> Self {
    .init(
      getDeliveries: {
        try await Task.sleep(nanoseconds: NSEC_PER_SEC * delay)
        return [.init(id: "1", location: "7a, Boston", deliveryDate: .now + 1)]
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
