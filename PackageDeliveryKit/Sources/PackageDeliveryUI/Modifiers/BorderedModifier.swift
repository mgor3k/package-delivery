import SwiftUI

public struct BorderedModifier: ViewModifier {
  let shadowOpacity: CGFloat
  let shadowRadius: CGFloat
  let shadowOffset: CGSize
  let cornerRadius: CGFloat
  
  public init(
    shadowOpacity: CGFloat = 0.05,
    shadowRadius: CGFloat = 50,
    shadowOffset: CGSize = .zero,
    cornerRadius: CGFloat = 32
  ) {
    self.shadowOpacity = shadowOpacity
    self.shadowRadius = shadowRadius
    self.shadowOffset = shadowOffset
    self.cornerRadius = cornerRadius
  }
  
  public func body(content: Content) -> some View {
    content
      .padding(.horizontal)
      .padding(.vertical, 6)
      .background(
        Color.white
          .clipShape(
            RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
          )
          .shadow(
            color: .black.opacity(shadowOpacity),
            radius: shadowRadius,
            x: shadowOffset.width,
            y: shadowOffset.height
          )
      )
      .background(
        RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
          .stroke(.gray.opacity(0.15), lineWidth: 2)
      )
  }
}

struct BorderedModifier_Previews: PreviewProvider {
  static var previews: some View {
    Text("test")
      .modifier(BorderedModifier())
  }
}
