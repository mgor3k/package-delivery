import SwiftUI
import PackageDeliveryUI

struct ServiceTileView: View {
  let item: ServiceItem
  let highlightedItem: ServiceItem
  
  var body: some View {
    VStack(alignment: .leading, spacing: 12) {
      icon
        .font(.title)
      
      Text(item.tileName)
        .bold()
    }
    .padding(.vertical)
    .padding(.horizontal, 6)
    .modifier(BorderedModifier(
      shadowOpacity: item == highlightedItem ? 0.05 : 0,
      shadowRadius: 15,
      shadowOffset: .init(width: 10, height: 10)
    ))
  }
}

private extension ServiceTileView {
  @ViewBuilder
  var icon: some View {
    switch item {
    case .myPackage:
      Image(systemName: "shippingbox.fill")
        .foregroundColor(.yellow)
    case .addPackage:
      Image(systemName: "shippingbox.fill")
        .foregroundColor(.yellow)
        .overlay(alignment: .topTrailing) {
          Image(systemName: "plus.circle")
            .font(.callout)
            .background(Color.white.clipShape(Circle()))
            .offset(x: 4, y: -4)
        }
    case .trackAndShipment:
      Image(systemName: "mappin.and.ellipse")
        .symbolRenderingMode(.multicolor)
    }
  }
}

extension ServiceItem {
  var tileName: String {
    switch self {
    case .addPackage:
      return "Add\nPackage"
    case .myPackage:
      return "My\nPackage"
    case .trackAndShipment:
      return "Track &\nShipment"
    }
  }
}

struct ServiceTileView_Previews: PreviewProvider {
  static var previews: some View {
    ServiceTileView(
      item: .trackAndShipment,
      highlightedItem: .addPackage
    )
  }
}
