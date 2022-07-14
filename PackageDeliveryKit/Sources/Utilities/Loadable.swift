import Foundation

public enum Loadable<Value> {
  case initial
  case loading
  case failed(Error)
  case success(Value)
}
