import SwiftUI

public struct BorderedModifier: ViewModifier {
  public init() {}
  
  public func body(content: Content) -> some View {
    content
      .padding()
      .background(
        Color.white
          .clipShape(
            RoundedRectangle(cornerRadius: 32, style: .continuous)
          )
          .shadow(color: .black.opacity(0.05),radius: 50)
      )
      .background(
        RoundedRectangle(cornerRadius: 32, style: .continuous)
          .stroke(.gray.opacity(0.2), lineWidth: 2)
      )
  }
}

struct BorderedModifier_Previews: PreviewProvider {
  static var previews: some View {
    Text("test")
      .modifier(BorderedModifier())
  }
}
