protocol Numeric : Comparable {
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

extension Numeric {
  func isBetween(a :Self, _ b: Self) -> Bool {
    return a <= self && self <= b
  }
}

class Clamped<T: Numeric> {
  let low: T;
  let high: T;

  var _val: T?;

  var value: T {
    set(x) {
      if (x.isBetween(low, high)) { _val = x }
      else { print("Invalid value: \(x), should be between \(low) and \(high)") }
    }
    get { return _val! }
  }

  init(low: T, high: T) {
    self.low = low
    self.high = high
  }
}

Exercise(2) {

  struct WeightedGrade {
    private var _grade: Clamped<Double>
    var grade: Double {
      set(x) { _grade.value = x }
      get { return _grade.value }
    }

    private var _weight: Clamped<Double>
    var weight: Double {
      set(x) { _weight.value = x }
      get { return _weight.value }
    }

    init(grade: Double, weight: Double) {
      _grade = Clamped(low: 0.0, high: 20.0)
      _weight = Clamped(low: 0.0, high: 100.0)
      self.grade = grade
      self.weight = weight
    }

    init(_ vals: (Double, Double)) {
      let (grade, weight) = vals
      self.init(grade: grade, weight: weight)
    }
  }

  func weightedAverage(grades: WeightedGrade...) -> Double {
    var average = 0.0
    for grade in grades {
      average += grade.grade * (grade.weight / 100)
    }

    let totalWeight = grades.map({ $0.weight })
                            .reduce(0.0, combine: { $0 + $1 })
    return average * (100 / totalWeight)
  }

  let finalsGrade  = WeightedGrade((2.0, 50))
  let midtermGrade = WeightedGrade((4.0, 20))
  let projectGrade = WeightedGrade((3.0, 30))

  print(weightedAverage(finalsGrade, midtermGrade, projectGrade))

}
