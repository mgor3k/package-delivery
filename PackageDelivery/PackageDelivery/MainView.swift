import SwiftUI
import PackageDeliveryKit

struct MainView: View {
  @State var tab: TabMenuItem = .home
  @State var navigationPath: NavigationPath = .init()

  var body: some View {
    NavigationStack(path: $navigationPath) {
      VStack {
        TabView(selection: $tab) {
          NavigationView {
            HomeView(navigationPath: $navigationPath)
              .toolbar(.hidden)
          }
          .tag(TabMenuItem.home)
          
          Text("Find")
            .tag(TabMenuItem.find)
          
          Text("Map")
            .tag(TabMenuItem.map)
          
          Text("Settings")
            .tag(TabMenuItem.settings)
        }
        .toolbar(.hidden, in: .tabBar)
        
        TabMenu(selectedItem: $tab)
      }
      .navigationDestination(for: Route.self) { route in
        switch route {
        case .map:
          MapView()
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
