extension Int {
  func isMultOf(n: Int) -> Bool {
    return self % n == 0;
  }
}

func fizzBuzz() {
  var mult = false
  var str: String = ""

  for i in 1...100 {
    str = ""
    mult = false
    if i.isMultOf(3) {
      mult = true;
      str += "Fizz";
    }
    if i.isMultOf(5) {
      mult = true;
      str += "Buzz";
    }
    print(mult ? str : i)
  }
}

fizzBuzz()
