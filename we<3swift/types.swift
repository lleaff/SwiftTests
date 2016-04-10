protocol Numeric {
  func +(lhs: Self, rhs: Self) -> Self
  func -(lhs: Self, rhs: Self) -> Self
  func *(lhs: Self, rhs: Self) -> Self
  func /(lhs: Self, rhs: Self) -> Self
  func %(lhs: Self, rhs: Self) -> Self
  init(_ v: Int)
}

extension Double : Numeric {}
extension Float  : Numeric {}
extension Int    : Numeric {}
extension Int8   : Numeric {}
extension Int16  : Numeric {}
extension Int32  : Numeric {}
extension Int64  : Numeric {}
extension UInt   : Numeric {}
extension UInt8  : Numeric {}
extension UInt16 : Numeric {}
extension UInt32 : Numeric {}
extension UInt64 : Numeric {}

// Misc

func Exercise(n: Int, _ ex: () -> ()) {
  let str = "Exercise \(n):"
  print((n > 1 ? "\n" : "") + str)
  print(String(repeating: Character("-"), count: str.characters.count))
  ex()
}

// 3.1

func average<T: Numeric>(a: T, _ b: T) -> T {
  return (a + b) / T(2)
}

Exercise(1) {
  let a = 2.0
  let b = 5.0

  assert(average(a, b) == 3.5)
  assert(average(20, 10) == 15)
  print("The average of \(a) and \(b) is \(average(a, b))")
}

// 3.2

Exercise(2) {
  extension Numeric {
    func isBetween(a :Self, _ b: Self) -> Bool {
      return a <= self && b <= self
    }
  }

  struct weightedGrade {
    private var _grade; 
    var grade: Double {
      set { }
      get { return _grade }
    }
    var weight: Double
  }

  let finalsGrade = 2.0
  let midtermGrade = 4.0
  let projectGrade = 3.0

}
