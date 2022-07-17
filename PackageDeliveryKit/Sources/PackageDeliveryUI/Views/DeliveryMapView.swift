import SwiftUI
import MapKit

public struct DeliveryMapView: UIViewRepresentable {
  let region: Binding<MKCoordinateRegion>
  
  public init(
    region: Binding<MKCoordinateRegion>
  ) {
    self.region = region
  }
  
  public func makeUIView(context: Context) -> MKMapView {
    let view = MKMapView()
    view.region = region.wrappedValue
    view.pointOfInterestFilter = .excludingAll
    view.mapType = .mutedStandard
    return view
  }
  
  public func updateUIView(_ uiView: MKMapView, context: Context) {}
}

struct DeliveryMapView_Previews: PreviewProvider {
  static var previews: some View {
    DeliveryMapView(region: .constant(.init(
      center: .init(latitude: 51.507, longitude: -0.12),
      span: .init(latitudeDelta: 0.01, longitudeDelta: 0.01)
    )))
  }
}
