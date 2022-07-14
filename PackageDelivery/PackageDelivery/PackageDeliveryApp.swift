import SwiftUI
import PackageDeliveryKit

@main
struct PackageDeliveryApp: App {
  var body: some Scene {
    WindowGroup {
      NavigationView {
        HomeView()
          .toolbar(.hidden)
      }
      .environmentObject(
        DeliveryStore(
          service: .live
        )
      )
    }
  }
}
