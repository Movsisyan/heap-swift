public struct Heap<Element: Comparable> {
  
  private var items = [Element]()
  
  public var peek: Element? {
    items.first
  }
  
  public var isEmpty: Bool {
    items.isEmpty
  }
  
  public mutating func poll() -> Element? {
    if items.isEmpty {
      return nil
    }
    
    let item = items.first
    let last = items.removeLast()
    items[0] = last
    
    heapifyDown()
    
    return item
  }
  
  public mutating func push(_ item: Element) {
    items.append(item)
    heapifyUp()
  }
  
}

// MARK: - Private helpers

private extension Heap {
  
  mutating func heapifyDown() {
    var index = 0
    while hasLeftChild(index) {
      var smalChildIndex = leftChildIndex(index)
      if hasRightChild(index) && rightChild(index) < leftChild(index) {
        smalChildIndex = rightChildIndex(index)
      }
      
      if items[index] < items[smalChildIndex] {
        break
      } else {
        swapElementsAtIndexes(index, smalChildIndex)
      }
      
      index = smalChildIndex
    }
  }
  
  mutating func heapifyUp() {
    var index = items.count - 1
    while hasParent(index) && parent(index) > items[index] {
      swapElementsAtIndexes(parentIndex(index), index)
      index = parentIndex(index)
    }
  }
  
  mutating func swapElementsAtIndexes(_ indexOne: Int, _ indexTwo: Int) {
    let temp = items[indexOne]
    items[indexOne] = items[indexTwo]
    items[indexTwo] = temp
  }
  
  func hasLeftChild(_ index: Int) -> Bool {
    leftChildIndex(index) < items.count
  }
  
  func hasRightChild(_ index: Int) -> Bool {
    rightChildIndex(index) < items.count
  }
  
  func hasParent(_ index: Int) -> Bool {
    parentIndex(index) >= 0
  }
  
  func leftChildIndex(_ index: Int) -> Int {
    2 * index + 1
  }
  
  func rightChildIndex(_ index: Int) -> Int {
    2 * index + 2
  }
  
  func parentIndex(_ index: Int) -> Int {
    (index - 1)/2
  }
  
  func leftChild(_ index: Int) -> Element {
    items[leftChildIndex(index)]
  }
  
  func rightChild(_ index: Int) -> Element {
    items[rightChildIndex(index)]
  }
  
  func parent(_ index: Int) -> Element {
    items[parentIndex(index)]
  }
}
