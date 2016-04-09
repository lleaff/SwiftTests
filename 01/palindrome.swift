extension String {
  var length: Int { return self.characters.count }

  private func _isPalindrome() -> Bool {
    let start = self.startIndex
    let end = self.endIndex
    if (start >= end || self.length == 1) {
      return true
    }
    if self.characters.first != self.characters.last {
      return false
    }
    return self[start.advancedBy(1)..<end.advancedBy(-1)]._isPalindrome()
  }

  var isPalindrome: Bool {
    return _isPalindrome()
  }
}


print("yoman".isPalindrome)
print("yomannamoy".isPalindrome)
print("yomanamoy".isPalindrome)
