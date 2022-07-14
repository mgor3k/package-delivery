import SwiftUI

public struct BorderedModifier: ViewModifier {
  let shadowOpacity: CGFloat
  let shadowRadius: CGFloat
  let shadowOffset: CGSize
  
  public init(
    shadowOpacity: CGFloat = 0.05,
    shadowRadius: CGFloat = 50,
    shadowOffset: CGSize = .zero
  ) {
    self.shadowOpacity = shadowOpacity
    self.shadowRadius = shadowRadius
    self.shadowOffset = shadowOffset
  }
  
  public func body(content: Content) -> some View {
    content
      .padding(.horizontal)
      .padding(.vertical, 6)
      .background(
        Color.white
          .clipShape(
            RoundedRectangle(cornerRadius: 32, style: .continuous)
          )
          .shadow(
            color: .black.opacity(shadowOpacity),
            radius: shadowRadius,
            x: shadowOffset.width,
            y: shadowOffset.height
          )
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
