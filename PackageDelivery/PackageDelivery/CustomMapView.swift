import SwiftUI
import MapKit

struct CustomMapView: UIViewRepresentable {
  let region: Binding<MKCoordinateRegion>
  
  func makeUIView(context: Context) -> MKMapView {
    let view = MKMapView()
    view.region = region.wrappedValue
    view.pointOfInterestFilter = .excludingAll
    view.mapType = .mutedStandard
    return view
  }
  
  func updateUIView(_ uiView: MKMapView, context: Context) {}
}

struct CustomMapView_Previews: PreviewProvider {
  static var previews: some View {
    CustomMapView(region: .constant(.init(
      center: .init(latitude: 51.507, longitude: -0.12),
      span: .init(latitudeDelta: 0.01, longitudeDelta: 0.01)
    )))
  }
}
