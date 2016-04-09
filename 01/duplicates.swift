func duplicates<T: Hashable>(a: [T]) -> [(T, Int)] {
  var nums = [T: Int]()
  for x in a {
    nums[x] = nums[x] == nil ? 1 : nums[x]! + 1;
  }
  return nums.filter() {
    let (_, occurences) = $0
    return occurences > 1
  }
}

let testArray = ["one", "one", "one", "two", "two", "three"]

print(duplicates(testArray))
