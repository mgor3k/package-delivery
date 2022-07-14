import Combine
import Lottie
import SwiftUI

public struct LottieView: UIViewRepresentable {
  let name: String
  let loopMode: LottieLoopMode
  
  private let animationView = AnimationView()
  
  public init(
    name: String,
    loopMode: LottieLoopMode = .loop
  ) {
    self.name = name
    self.loopMode = loopMode
  }
  
  public func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
    let view = UIView(frame: .zero)
    
    animationView.animation = Animation.named(name)
    animationView.contentMode = .scaleAspectFit
    animationView.loopMode = loopMode
    animationView.transform = .init(scaleX: -1, y: 1)
    animationView.backgroundBehavior = .pauseAndRestore
    animationView.play()
    
    animationView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(animationView)
    
    NSLayoutConstraint.activate([
      animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
      animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
    ])
    
    return view
  }
  
  public func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {}
}
