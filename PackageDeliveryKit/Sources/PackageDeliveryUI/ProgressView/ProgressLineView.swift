import SwiftUI

struct ProgressLineView: View {
  var isDashed = false
  
  var body: some View {
    HStack(spacing: 0) {
      Circle()
        .fill(Color.black)
        .frame(width: 4, height: 4)
        .offset(y: -0.5)
      Line()
        .stroke(style: StrokeStyle(lineWidth: 1))
        .frame(height: 1)
      if isDashed {
        Line()
          .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
          .frame(height: 1)
      } else {
        Circle()
          .fill(Color.black)
          .frame(width: 4, height: 4)
          .offset(y: -0.5)
      }
    }
  }
}

struct ProgressLineView_Previews: PreviewProvider {
  static var previews: some View {
    ProgressLineView()
      .padding()
  }
}
