import SwiftUI
import MapKit

public struct DeliveryMapView: UIViewRepresentable {
  let mode: Mode
  
  let map = MKMapView()
    
  public init(
    mode: Mode
  ) {
    self.mode = mode
  }
  
  public func makeUIView(context: Context) -> MKMapView {
    map.delegate = context.coordinator
    map.pointOfInterestFilter = .excludingAll
    map.mapType = .mutedStandard

    switch mode {
    case let .region(region):
      map.region = region
    case let .route(start, end):
      context.coordinator.showRouteOnMap(
        startCoordinate: start,
        destinationCoordinate: end
      )
    }
        
    return map
  }
  
  public func updateUIView(_ uiView: MKMapView, context: Context) {}
}

extension DeliveryMapView {
  public func makeCoordinator() -> Coordinator {
    Coordinator(map: map)
  }
  
  public final class Coordinator: NSObject, MKMapViewDelegate {
    let map: MKMapView
    
    init(map: MKMapView) {
      self.map = map
    }
    
    public func mapView(
      _ mapView: MKMapView,
      rendererFor overlay: MKOverlay
    ) -> MKOverlayRenderer {
      let renderer = MKPolylineRenderer(overlay: overlay)
      renderer.strokeColor = .black
      renderer.lineWidth = 3
      return renderer
    }
    
    func showRouteOnMap(
      startCoordinate: CLLocationCoordinate2D,
      destinationCoordinate: CLLocationCoordinate2D
    ) {
      let request = MKDirections.Request()
      request.source = .init(
        placemark: .init(coordinate: startCoordinate)
      )
      request.destination = .init(
        placemark: .init(coordinate: destinationCoordinate)
      )
      request.requestsAlternateRoutes = true
      request.transportType = .automobile
      
      let directions = MKDirections(request: request)
      
      directions.calculate { [weak self] response, _ in
        if let route = response?.routes.first {
          self?.map.addOverlay(route.polyline)
          self?.map.setVisibleMapRect(route.polyline.boundingMapRect, edgePadding: .init(top: 80, left: 20, bottom: 100, right: 20), animated: true)
        }
      }
    }
  }
}

public extension DeliveryMapView {
  enum Mode {
    case region(MKCoordinateRegion)
    case route(
      start: CLLocationCoordinate2D,
      end: CLLocationCoordinate2D
    )
  }
}

struct DeliveryMapView_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      DeliveryMapView(mode: .region(
        .init(
          center: .init(latitude: 51.507, longitude: -0.12),
          span: .init(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )
      ))
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
    }
  }
}
