import SwiftUI
import PackageDeliveryKit

@main
struct PackageDeliveryApp: App {
  var body: some Scene {
    WindowGroup {
      MainView()
        .environmentObject(
          DeliveryStore(
            service: .live()
          )
        )
        .environmentObject(
          CardStore(
            service: .live()
          )
        )
    }
  }
}
