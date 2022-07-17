import SwiftUI
import PackageDeliveryKit
import PackageDeliveryUI

struct ContactView: View {
  var callService: CallService = .live
  
  let contact: Contact
  
  var body: some View {
    Button(action: { callService.callNumber(contact.phoneNumber) }) {
      HStack(spacing: 18) {
        ContactAvatarView(url: contact.avatarUrl)
        VStack(alignment: .leading, spacing: 6) {
          Text(contact.name)
            .bold()
          Text(contact.phoneNumber)
        }
        Spacer()
        Image(systemName: "phone.fill")
          .font(.title)
      }
      .foregroundColor(.black)
      .padding(8)
      .modifier(BorderedModifier())
    }
  }
}

struct ContactView_Previews: PreviewProvider {
  static var previews: some View {
    ContactView(
      callService: .preview,
      contact: .preview
    )
      .padding()
  }
}
