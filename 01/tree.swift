indirect enum Tree<T>{
  typealias Element = T
  case Branch(Tree<Element>, Element, Tree<Element>)
  case Leaf
}

extension Tree {
  func flatten() -> [Element] {
    var vals = [Element]()
    func traverse(tree: Tree<T>) {
      if case .Branch(let left, let val, let right) = tree {
        vals.append(val)
        traverse(left)
        traverse(right)
      }
    }
    traverse(self)
    return vals
  }
}

extension Tree : SequenceType {
  func generate() -> TreeGenerator<Element> {
    return TreeGenerator(self)
  }
}

class TreeGenerator<T> : GeneratorType {
  let vals: [T]
  var valsGenerator: IndexingGenerator<[T]>
  var i: Int = 0
  
  init(_ tree: Tree<T>) {
    vals = tree.flatten()
    valsGenerator = vals.generate()
  }

  func next() -> T? {
    return valsGenerator.next()
  }
}

//------------------------------------------------------------

let myTree = Tree.Branch(Tree.Branch(Tree.Leaf,
                                    3,
                                    Tree.Leaf),
                    5,
                    Tree.Branch(Tree.Branch(Tree.Leaf,
                                            2,
                                            Tree.Leaf),
                                4,
                                Tree.Leaf))

for x in myTree {
  print(x)
}
