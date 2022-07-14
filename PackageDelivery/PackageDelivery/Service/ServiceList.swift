import SwiftUI

struct ServiceList: View {
  var services = ServiceItem.allCases
  let highlightedItem: ServiceItem = .myPackage
  
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      LazyHStack(spacing: 18) {
        ForEach(services, id: \.rawValue) { service in
          ServiceTileView(
            item: service,
            highlightedItem: highlightedItem
          )
        }
      }
      .padding(32)
    }
    .padding(.vertical, -32)
  }
}

struct ServiceList_Previews: PreviewProvider {
  static var previews: some View {
    ServiceList()
  }
}
