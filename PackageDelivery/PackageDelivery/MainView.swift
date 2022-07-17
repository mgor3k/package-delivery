import SwiftUI
import PackageDeliveryKit

struct MainView: View {
  @State var navigationPath: NavigationPath = .init()

  var body: some View {
    NavigationStack(path: $navigationPath) {
      VStack {
        NavigationView {
          HomeView(navigationPath: $navigationPath)
            .toolbar(.hidden)
        }
        
        TabMenu()
      }
      .navigationDestination(for: Route.self) { route in
        switch route {
        case .map:
          MapView(mode: .region(.init(
            center: .init(
              latitude: 50.059091,
              longitude: 19.976023),
            span: .init(
              latitudeDelta: 0.5,
              longitudeDelta: 0.5
            ))))
        case let .details(delivery):
          DeliveryView(delivery: delivery)
        }
      }
    }
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
      .environmentObject(DeliveryStore.preview())
  }
}
