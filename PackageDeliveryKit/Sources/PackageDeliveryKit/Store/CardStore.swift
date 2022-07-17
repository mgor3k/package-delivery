import Foundation
import Utilities

public final class CardStore: ObservableObject {
  private let service: CardService
  
  @Published public var activeCard: Loadable<Card> = .initial
  
  public init(service: CardService) {
    self.service = service
  }
}

public extension CardStore {
  @MainActor
  func fetchActiveCard() async {
    if activeCard.value == nil {
      activeCard = .loading
    }
    
    do {
      let card = try await service.getActiveCard()
      activeCard = .success(card)
    } catch is CancellationError {
    } catch {
      activeCard = .failed(error)
    }
  }
}

#if DEBUG
public extension CardStore {
  static var preview: CardStore {
    CardStore(service: .preview)
  }
}
#endif
