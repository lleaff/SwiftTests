func occurences<T: Hashable>(a: [T]) -> [T: Int] {
  var nums = [T: Int]()
  for x in a {
    nums[x] = nums[x] == nil ? 1 : nums[x]! + 1;
  }
  return nums
}

func duplicates<T: Hashable>(a: [T]) -> [(T, Int)] {
  return occurences(a).filter() {
    let (_, occurences) = $0
    return occurences > 1
  }
}

let testArray = ["one", "one", "one", "two", "two", "three"]

print(testArray)
for (val, occurences) in duplicates(testArray) {
  print("\(occurences) occurences of \(val)")
}
