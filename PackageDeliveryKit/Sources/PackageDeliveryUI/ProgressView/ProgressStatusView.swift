import SwiftUI
import PackageDeliveryKit

public struct ProgressStatusView: View {
  let deliveryStatus: Delivery.Status
  
  public init(deliveryStatus: Delivery.Status) {
    self.deliveryStatus = deliveryStatus
  }

  public var body: some View {
    HStack(alignment: .myAlignment) {
      titledProgress(
        "Packed",
        withStatus: deliveryStatus.isPacked ? .done : .pending
      )
      
      ProgressLineView(isDashed: deliveryStatus == .packing)
      
      titledProgress(
        "Sent",
        withStatus: deliveryStatus.isPacked ? (deliveryStatus == .completed ? .done :.pending) : .incomplete
      )
      
      ProgressLineView(isDashed: deliveryStatus != .completed)
      
      titledProgress(
        "Until",
        withStatus: deliveryStatus == .completed ? .pending : .incomplete
      )
    }
  }
  
  @ViewBuilder
  func titledProgress(
    _ title: String,
    withStatus status: ProgressStatusIndicator.Status
  ) -> some View {
    VStack {
      ProgressStatusIndicator(status: status)
        .alignmentGuide(.myAlignment) {
          $0[.myAlignment]
        }
      Text(title)
    }
  }
}

private extension Delivery.Status {
  var isPacked: Bool {
    [.sent, .completed].contains(self)
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
    VStack(spacing: 32) {
      ProgressStatusView(deliveryStatus: .packing)
      ProgressStatusView(deliveryStatus: .sent)
      ProgressStatusView(deliveryStatus: .completed)
    }
      .padding()
  }
}
