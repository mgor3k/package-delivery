import SwiftUI
import PackageDeliveryKit

struct HomeView: View {
  @EnvironmentObject var store: DeliveryStore
  @Binding var navigationPath: NavigationPath
  
  var body: some View {
    VStack {
      VStack(alignment: .leading, spacing: 18) {
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
          .font(.title)
          .bold()
          .padding(.horizontal, 24)
        
        if let delivery = store.pendingDelivery {
          Button(action: { navigationPath.append(Route.details(delivery)) }) {
            TrackedDeliveryView(delivery: delivery)
              .padding(.horizontal, 24)
          }
          .transition(.slide)
        }
        
        Text("Services")
          .font(.headline)
          .padding(.horizontal, 24)
        
        ServiceList()
          .frame(height: 160)
        
        Text("Card")
          .font(.headline)
          .padding(.horizontal, 24)
        
        Spacer()
      }
      .animation(.default, value: store.pendingDelivery)
    }
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView(navigationPath: .constant(.init()))
      .environmentObject(DeliveryStore.preview())
  }
}
