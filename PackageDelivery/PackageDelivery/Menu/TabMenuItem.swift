import Foundation

enum TabMenuItem: Int, CaseIterable {
  case home
  case find
  case map
  case settings
}

extension TabMenuItem {
  var title: String {
    switch self {
    case .home:
      return "Home"
    case .find:
      return "Find"
    case .map:
      return "Map"
    case .settings:
      return "Settings"
    }
  }
  
  var systemIconName: String {
    switch self {
    case .home:
      return "house"
    case .find:
      return "paperplane.fill"
    case .map:
      return "map"
    case .settings:
      return "gearshape"
    }
  }
}
