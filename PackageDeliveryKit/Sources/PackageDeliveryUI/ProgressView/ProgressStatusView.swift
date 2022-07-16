import SwiftUI

public struct ProgressStatusView: View {
  public init() {}

  public var body: some View {
    HStack(alignment: .myAlignment) {
      VStack {
        ProgressStatusIndicator(status: .done)
          .alignmentGuide(.myAlignment) {
            $0[.myAlignment]
          }
        Text("Packed")
      }
      
      ProgressLineView()
      
      VStack {
        ProgressStatusIndicator(status: .pending)
          .alignmentGuide(.myAlignment) {
            $0[.myAlignment]
          }
        Text("Sent")
      }
      
      ProgressLineView(isDashed: true)
      
      VStack {
        ProgressStatusIndicator(status: .incomplete)
          .alignmentGuide(.myAlignment) {
            $0[.myAlignment]
          }
        Text("Until")
      }
    }
  }
}

extension VerticalAlignment {
  private enum MyAlignment: AlignmentID {
    static func defaultValue(in context: ViewDimensions) -> CGFloat {
      return context[VerticalAlignment.center]
    }
  }
  
  static let myAlignment = VerticalAlignment(MyAlignment.self)
}

struct ProgressStatusView_Previews: PreviewProvider {
  static var previews: some View {
    ProgressStatusView()
      .padding()
  }
}