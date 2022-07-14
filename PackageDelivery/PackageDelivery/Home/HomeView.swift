import SwiftUI
import PackageDeliveryKit

struct HomeView: View {
  @EnvironmentObject var store: DeliveryStore
  @State var navigationPath: NavigationPath = .init()
  
  var body: some View {
    VStack {
      NavigationStack(path: $navigationPath) {
        VStack(alignment: .leading, spacing: 24) {
          HStack {
            Spacer()
            
            Button(action: { navigationPath.append(Route.map) }) {
              Image(systemName: "map")
                .font(.headline)
                .foregroundColor(.black.opacity(0.9))
                .padding(12)
                .background(
                  Ellipse()
                    .stroke(
                      .gray.opacity(0.4),
                      style: .init(lineWidth: 1)
                    )
                )
            }
            .padding()
          }
          
          Text("Hello!\nTrack your parcel!")
            .font(.largeTitle)
            .bold()
            .padding(.horizontal, 24)
          
          if let delivery = store.pendingDelivery {
            TrackedDeliveryView(delivery: delivery)
              .padding(.horizontal, 24)
              .transition(.slide)
          }
          
          Text("Services")
            .font(.headline)
            .padding(.horizontal, 24)
          
          Spacer()
        }
        .animation(.default, value: store.pendingDelivery)
        .navigationDestination(for: Route.self) { route in
          Text("haha")
        }
      }
    }
  }
}

extension HomeView {
  enum Route: Hashable {
    case map
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
