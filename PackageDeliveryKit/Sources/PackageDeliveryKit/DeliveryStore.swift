import Foundation

public final class DeliveryStore: ObservableObject {
  private let service: DeliveryService
  
  @Published public var pendingDelivery: Delivery?
  
  public init(
    service: DeliveryService
  ) {
    self.service = service
    fetchPendingDelivery()
  }
}

private extension DeliveryStore {
  func fetchPendingDelivery() {
    Task { @MainActor in
      do {
        let deliveries = try await service.getDeliveries()
        pendingDelivery = deliveries.first
      } catch {
        // TODO: Error handling
      }
    }
  }
}

#if DEBUG
public extension DeliveryStore {
  static func preview(deliveries: [Delivery] = [.preview()]) -> DeliveryStore {
    .init(service: .preview(deliveries: deliveries))
  }
}
#endif
