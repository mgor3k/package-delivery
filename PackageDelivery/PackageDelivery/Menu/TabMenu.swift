import SwiftUI

struct TabMenu: View {
  @Namespace private var namespace
  
  let menuItems = TabMenuItem.allCases
  
  @Binding var selectedItem: TabMenuItem
  
  var body: some View {
    HStack {
      ForEach(menuItems, id: \.rawValue) { item in
        VStack(spacing: 0) {
          if selectedItem == item {
            Text(item.title)
              .font(.callout)
              .frame(maxWidth: .infinity)
          } else {
            Image(systemName: item.systemIconName)
              .frame(maxWidth: .infinity)
          }
        }
        .background(Color.white)
        .animation(.none, value: selectedItem)
        .onTapGesture {
          selectedItem = item
        }
        .padding(.bottom, 6)
        .overlay(alignment: .bottom) {
          selectedItem == item
          ? Rectangle()
            .fill(Color.black)
            .frame(width: 25, height: 2, alignment: .bottom)
            .matchedGeometryEffect(id: "selected", in: namespace)
          : nil
        }
        .animation(.default, value: selectedItem)
      }
    }
    .frame(maxWidth: .infinity)
    .padding()
  }
}

struct TabMenu_Previews: PreviewProvider {
  static var previews: some View {
    TabMenu(selectedItem: .constant(.home))
  }
}
