import SwiftUI
import MapKit
import PackageDeliveryUI

struct MapView: View {
  var body: some View {
    DeliveryMapView(mode: .route(
      start: .init(
        latitude: 50.0647,
        longitude: 19.9450
      ),
      end: .init(
        latitude: 52.2297,
        longitude: 21.0122
      ))
    )
    .allowsHitTesting(false)
  }
}

struct MapView_Previews: PreviewProvider {
  static var previews: some View {
    MapView()
  }
}
