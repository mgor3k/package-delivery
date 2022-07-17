import SwiftUI

struct ProgressLineView: View {
  var isDashed = false
  
  var body: some View {
    HStack(spacing: 0) {
      Circle()
        .fill(Color.black)
        .frame(width: 5, height: 5)
        .offset(y: -1)
      if isDashed {
        HStack(spacing: 0) {
          Line()
            .stroke(style: StrokeStyle(lineWidth: 2))
            .frame(height: 2)
          Line()
            .stroke(style: StrokeStyle(lineWidth: 2, dash: [5]))
            .frame(height: 2)
        }
        .frame(height: 5)
          .mask {
            LinearGradient(
              colors: [.black.opacity(0.7), .black.opacity(0.5), .clear],
              startPoint: .leading,
              endPoint: .trailing
            )
          }
      } else {
        Line()
          .stroke(style: StrokeStyle(lineWidth: 2))
          .frame(height: 2)
        Circle()
          .fill(Color.black)
          .frame(width: 5, height: 5)
          .offset(y: -1)
      }
    }
  }
}

struct ProgressLineView_Previews: PreviewProvider {
  static var previews: some View {
    VStack(spacing: 24) {
      ProgressLineView()
      ProgressLineView(isDashed: true)
    }
      .padding()
  }
}
