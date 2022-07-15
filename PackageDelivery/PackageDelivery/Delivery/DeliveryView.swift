import SwiftUI
import PackageDeliveryKit

struct DeliveryView: View {
  let delivery: Delivery
  
  var body: some View {
    Text("Hello, World! \(delivery.location)")
  }
}

struct DeliveryView_Previews: PreviewProvider {
  static var previews: some View {
    DeliveryView(delivery: .preview())
  }
}
