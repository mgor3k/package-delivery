import SwiftUI
import PackageDeliveryKit
import PackageDeliveryUI

struct DeliveryView: View {
  @Environment(\.dismiss) var dismiss
  let delivery: Delivery
  
  var body: some View {
    // TODO: Move to NavigationBar
    VStack(spacing: 24) {
      VStack(alignment: .leading, spacing: 24) {
        HStack {
          Button(action: { dismiss() }) {
            Image(systemName: "chevron.backward")
              .bold()
              .foregroundColor(.black)
          }
          Spacer()
        }
        
        Text("Delivery\nDetails")
          .font(.title)
          .bold()
      }
      .padding(24)
      .padding(.horizontal, 12)
      
      ProgressStatusView(deliveryStatus: delivery.status)
        .padding(.horizontal, 32)
      
      DeliveryMapView(mode: .route(
        start: .init(
          latitude: delivery.currentLocation.latitude,
          longitude: delivery.currentLocation.longitude
        ),
        end: .init(
          latitude: delivery.deliveryLocation.latitude,
          longitude: delivery.deliveryLocation.longitude
        ))
      )
      .allowsHitTesting(false)
      .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
      .padding(24)
      .padding(.horizontal, 12)
      
      ContactView(contact: delivery.driverContact)
        .padding(.horizontal, 32)
    }
    .frame(maxHeight: .infinity, alignment: .top)
    .navigationBarBackButtonHidden(true)
  }
}

struct DeliveryView_Previews: PreviewProvider {
  static var previews: some View {
    DeliveryView(delivery: .preview())
  }
}
