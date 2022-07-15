import Foundation
import PackageDeliveryKit

enum Route: Hashable {
  case map
  case details(Delivery)
  
  func hash(into hasher: inout Hasher) {
    switch self {
    case .map:
      return hasher.combine("map")
    case .details(let delivery):
      return hasher.combine("details+\(delivery.id)")
    }
  }
}
