import Foundation

public enum CardFormatter {
  public static func secret(_ input: String) -> String {
    var result = ""
    for (index, letter) in input.enumerated() {
      if index == 4 || index == 8 { result.append(" ") }
      if index <= 7 {
        result.append("·")
      } else {
        result.append(letter)
      }
    }
    return result
  }
}
