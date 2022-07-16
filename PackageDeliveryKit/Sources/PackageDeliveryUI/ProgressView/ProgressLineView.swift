import SwiftUI

struct ProgressLineView: View {
  var body: some View {
    HStack(spacing: 0) {
      Circle()
        .fill(Color.black)
        .frame(width: 4, height: 4)
      Rectangle()
        .frame(height: 1)
      Circle()
        .fill(Color.black)
        .frame(width: 4, height: 4)
    }
  }
}

struct ProgressLineView_Previews: PreviewProvider {
  static var previews: some View {
    ProgressLineView()
      .padding()
  }
}
