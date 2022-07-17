import Foundation

public enum Loadable<Value> {
  case initial
  case loading
  case failed(Error)
  case success(Value)
}

extension Loadable: Equatable where Value: Equatable {
  public static func == (lhs: Loadable<Value>, rhs: Loadable<Value>) -> Bool {
    switch (lhs, rhs) {
    case (.initial, .initial), (.loading, .loading):
      return true
    case let (.failed(error1), .failed(error2)):
      return error1.localizedDescription == error2.localizedDescription
    case let (.success(value1), .success(value2)):
      return value1 == value2
    default:
      return false
    }
  }
}

public extension Loadable {
  var isLoading: Bool {
    if case .loading = self {
      return true
    }
    return false
  }
  
  var value: Value? {
    if case let .success(value) = self {
      return value
    }
    return nil
  }
}
