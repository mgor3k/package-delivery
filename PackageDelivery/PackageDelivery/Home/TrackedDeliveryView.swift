import SwiftUI
import PackageDeliveryKit

struct TrackedDeliveryView: View {
  let delivery: Delivery
  
  static let formatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    return formatter
  }()
  
  var body: some View {
    HStack {
      VStack(alignment: .leading, spacing: 24) {
        section(
          imageName: "map",
          title: "Location",
          value: delivery.location
        )
        
        section(
          imageName: "clock",
          title: "Est. Time",
          value: Self.formatter.string(from: delivery.deliveryDate)
        )
      }
      .padding()
      
      Spacer()
      
      Image("delivery-truck")
        .resizable()
        .scaledToFit()
        .frame(height: 100)
    }
    .padding()
    .background(
      Color.white
        .clipShape(RoundedRectangle(cornerRadius: 32, style: .continuous))
        .shadow(color: .black.opacity(0.05),radius: 50)
    )
    .background(
      RoundedRectangle(cornerRadius: 32, style: .continuous)
        .stroke(.gray.opacity(0.2), lineWidth: 2)
    )
  }
}

extension TrackedDeliveryView {
  func section(
    imageName: String,
    title: String,
    value: String
  ) -> some View {
    HStack(spacing: 14) {
      Image(systemName: imageName)
        .foregroundColor(.gray)
        .frame(width: 12)
      VStack(alignment: .leading, spacing: 4) {
        Text(title)
          .foregroundColor(.gray)
        Text(value)
          .bold()
      }
    }
  }
}

struct TrackedDeliveryView_Previews: PreviewProvider {
  static var previews: some View {
    TrackedDeliveryView(
      delivery: .preview()
    )
  }
}
