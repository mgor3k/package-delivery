import SwiftUI
import PackageDeliveryKit
import PackageDeliveryUI

struct ActiveCardPreviewView: View {
  @EnvironmentObject var store: CardStore
  
  var body: some View {
    HStack(spacing: 16) {
      Image(systemName: "creditcard.fill")
        .font(.title)
        .overlay {
          store.activeCard.isLoading ? Color.white.overlay { ProgressView() } : nil
        }
      
      Text(cardNumber)
        .redacted(reason: store.activeCard.isLoading ? .placeholder : [])
      
      Spacer()
      
      Image(systemName: "chevron.right")
    }
    .padding(.vertical)
    .modifier(BorderedModifier(cornerRadius: 20))
    .task {
      await store.fetchActiveCard()
    }
  }
}

private extension ActiveCardPreviewView {
  var cardNumber: String {
    let number = store.activeCard.value?.number ?? "111-222-333-4444"
    let formattedNumber = CardFormatter.secret(number)
    return formattedNumber
  }
}

struct ActiveCardPreviewView_Previews: PreviewProvider {
  static var previews: some View {
    ActiveCardPreviewView()
      .environmentObject(CardStore.preview)
      .padding()
  }
}
