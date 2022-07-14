import SwiftUI
import PackageDeliveryKit
import PackageDeliveryUI

struct TrackedDeliveryView: View {
  let delivery: Delivery
  
  static let formatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    return formatter
  }()
  
  var body: some View {
    HStack {
      VStack(alignment: .leading, spacing: 24) {
        TitledIcon(
          systemName: "map",
          title: "Location",
          description: delivery.location
        )
        
        TitledIcon(
          systemName: "clock",
          title: "Est. Time",
          description: Self.formatter.string(from: delivery.deliveryDate)
        )
      }
      .padding()
      
      Spacer()
    }
    .modifier(BorderedModifier())
    .overlay(alignment: .trailing) {
      LottieView(name: "truck")
        .scaledToFit()
        .frame(width: 200, height: 300)
        .offset(x: 15)
    }
  }
}

struct TrackedDeliveryView_Previews: PreviewProvider {
  static var previews: some View {
    TrackedDeliveryView(delivery: .preview())
  }
}
