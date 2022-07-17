import Foundation
import UIKit

public struct CallService {
  public let callNumber: (String) -> Void
}

public extension CallService {
  static var live: Self {
    .init(
      callNumber: { number in
        let phone = "tel://"
        let phoneNumberformatted = phone + number
        if let url = URL(string: phoneNumberformatted) {
          UIApplication.shared.open(url)
        }
      }
    )
  }
}

#if DEBUG
public extension CallService {
  static var preview: Self {
    .init(callNumber: { _ in })
  }
}
#endif
