import SwiftUI

public struct TitledIcon: View {
  let systemName: String
  let title: String
  let description: String
  
  public init(
    systemName: String,
    title: String,
    description: String
  ) {
    self.systemName = systemName
    self.title = title
    self.description = description
  }
  
  public var body: some View {
    HStack(spacing: 14) {
      Image(systemName: systemName)
        .foregroundColor(.gray)
        .frame(width: 12)
      VStack(alignment: .leading, spacing: 4) {
        Text(title)
          .foregroundColor(.gray)
        Text(description)
          .bold()
          .foregroundColor(.black)
      }
    }
  }
}

struct TitledIcon_Previews: PreviewProvider {
  static var previews: some View {
    TitledIcon(
      systemName: "map",
      title: "title",
      description: "description"
    )
  }
}
