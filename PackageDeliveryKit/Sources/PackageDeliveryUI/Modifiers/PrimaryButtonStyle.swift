import SwiftUI

public struct PrimaryButtonStyle: ButtonStyle {
  public init() {}
  
  public func makeBody(configuration: Configuration) -> some View {
    configuration
      .label
      .padding()
      .foregroundColor(.white)
      .frame(maxWidth: .infinity)
      .background(Color.black)
      .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
      .opacity(configuration.isPressed ? 0.7 : 1)
  }
}

struct PrimaryButtonStyle_Previews: PreviewProvider {
  static var previews: some View {
    Button(action: {}) {
      Text("Button")
    }
    .buttonStyle(PrimaryButtonStyle())
    .padding()
  }
}
