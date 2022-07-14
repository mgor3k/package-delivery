import Combine
import Lottie
import SwiftUI

struct LottieView: UIViewRepresentable {
  let name: String
  var loopMode: LottieLoopMode = .loop
  
  private let animationView = AnimationView()
  
  func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
    let view = UIView(frame: .zero)
    
    animationView.animation = Animation.named(name)
    animationView.contentMode = .scaleAspectFit
    animationView.loopMode = loopMode
    animationView.transform = .init(scaleX: -1, y: 1)
    animationView.play()
    
    animationView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(animationView)
    
    NSLayoutConstraint.activate([
      animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
      animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
    ])
    
    return view
  }
  
  func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {}
  
}

extension LottieView {
  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }
  
  final class Coordinator {
    var parent: LottieView
    var subscriptions: Set<AnyCancellable> = []
    
    init(_ parent: LottieView) {
      self.parent = parent
      setupBindings()
    }
  }
}

extension LottieView.Coordinator {
  func setupBindings() {
    NotificationCenter
      .default
      .publisher(for: UIApplication.willResignActiveNotification)
      .sink { [weak self] _ in
        self?.parent.animationView.pause()
      }
      .store(in: &subscriptions)
    
    NotificationCenter
      .default
      .publisher(for: UIApplication.willEnterForegroundNotification)
      .sink { [weak self] _ in
        self?.parent.animationView.play()
      }
      .store(in: &subscriptions)
  }
}
