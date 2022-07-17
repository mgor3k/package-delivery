import SwiftUI

struct ContactAvatarView: View {
  let url: URL?
  var size: CGFloat = 55
  
  var body: some View {
    AsyncImage(url: url) { phase in
      switch phase {
      case .empty:
        ProgressView()
          .progressViewStyle(.circular)
          .frame(width: size, height: size)
      case .failure:
        Circle()
          .fill(Color.red)
          .overlay {
            Text("Error")
              .font(.caption2)
          }
          .frame(width: size, height: size)
      case let .success(image):
        image
          .resizable()
          .frame(width: size, height: size)
          .clipShape(Circle())
      @unknown default:
        Circle()
          .fill(Color.red)
          .overlay {
            Text("Error")
              .font(.caption2)
          }
          .frame(width: size, height: size)
      }
    }
  }
}

struct ContactAvatarView_Previews: PreviewProvider {
  static var previews: some View {
    ContactAvatarView(
      url: .init(string: "https://i.pravatar.cc/300")
    )
  }
}
