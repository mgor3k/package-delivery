import SwiftUI
import MapKit
import PackageDeliveryUI

struct MapView: View {
  @State var region = MKCoordinateRegion(
    center: .init(latitude: 51.507, longitude: -0.12),
    span: .init(latitudeDelta: 0.01, longitudeDelta: 0.01)
  )
  
  var body: some View {
    DeliveryMapView(
      region: $region
    )
    .allowsHitTesting(false)
  }
}

struct MapView_Previews: PreviewProvider {
  static var previews: some View {
    MapView()
  }
}
