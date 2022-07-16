import SwiftUI

struct ProgressStatusIndicator: View {
  let status: Status
  
  var body: some View {
    Circle()
      .fill(status != .incomplete ? Color.green.opacity(0.5) : Color.clear)
      .frame(width: 36, height: 36)
      .overlay {
        overlay(forStatus: status)
      }
  }
  
  @ViewBuilder
  func overlay(forStatus status: Status) -> some View {
    switch status {
    case .done:
      Image(systemName: "checkmark")
    case .pending, .incomplete:
      Circle()
        .fill(Color.black)
        .frame(width: 10, height: 10)
    }
  }
}

extension ProgressStatusIndicator {
  enum Status: CaseIterable {
    case done, pending, incomplete
  }
}

struct ProgressStatusIndicator_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      ForEach(ProgressStatusIndicator.Status.allCases, id: \.self) { status in
        ProgressStatusIndicator(status: status)
      }
    }
  }
}
