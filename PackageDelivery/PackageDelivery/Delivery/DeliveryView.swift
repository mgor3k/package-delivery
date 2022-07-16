import SwiftUI
import PackageDeliveryKit

struct DeliveryView: View {
  @Environment(\.dismiss) var dismiss
  let delivery: Delivery
  
  var body: some View {
    // TODO: Move to NavigationBar
    VStack {
      VStack(alignment: .leading, spacing: 24) {
        HStack {
          Button(action: { dismiss() }) {
            Image(systemName: "chevron.backward")
              .bold()
              .foregroundColor(.black)
          }
          Spacer()
        }
        
        Text("Delivery\nDetails")
          .font(.title)
          .bold()
      }
      .padding(24)
      .padding(.horizontal, 12)
      
      Text("hasdh")
    }
    .frame(maxHeight: .infinity, alignment: .top)
    .navigationBarBackButtonHidden(true)
  }
}

struct DeliveryView_Previews: PreviewProvider {
  static var previews: some View {
    DeliveryView(delivery: .preview())
  }
}
