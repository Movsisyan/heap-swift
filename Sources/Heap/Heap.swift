public struct Heap<Element: Comparable> {
  
  private var items = [Element]()
  
  private func hasLeftChild(_ index: Int) -> Bool {
    leftChildIndex(index) < items.count
  }
  
  private func hasRightChild(_ index: Int) -> Bool {
    rightChildIndex(index) < items.count
  }
  
  private func hasParent(_ index: Int) -> Bool {
    parentIndex(index) >= 0
  }
  
  private func leftChildIndex(_ index: Int) -> Int {
    2 * index + 1
  }
  
  private func rightChildIndex(_ index: Int) -> Int {
    2 * index + 2
  }
  
  private func parentIndex(_ index: Int) -> Int {
    (index - 1)/2
  }
  
  private func leftChild(_ index: Int) -> Element {
    items[leftChildIndex(index)]
  }
  
  private func rightChild(_ index: Int) -> Element {
    items[rightChildIndex(index)]
  }
  
  private func parent(_ index: Int) -> Element {
    items[parentIndex(index)]
  }
  
  private mutating func swapElementsAtIndexes(_ indexOne: Int, _ indexTwo: Int) {
    let temp = items[indexOne]
    items[indexOne] = items[indexTwo]
    items[indexTwo] = temp
  }
  
 }
