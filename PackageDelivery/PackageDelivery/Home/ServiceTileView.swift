import SwiftUI
import PackageDeliveryUI

struct ServiceTileView: View {
  var body: some View {
    VStack {
      Image(systemName: "shippingbox.fill")
        .foregroundColor(.yellow)
    }
    .modifier(BorderedModifier())
  }
}

struct ServiceTileView_Previews: PreviewProvider {
  static var previews: some View {
    ServiceTileView()
  }
}
