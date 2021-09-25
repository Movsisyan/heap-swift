public struct Heap<Element: Comparable> {
  
  private var items = [Element]()
  private let heapifyDownComparator: (Element, Element) -> Bool
  private let heapifyUpComparator: (Element, Element) -> Bool
  
  public init(isMinHeap: Bool = true) {
    self.heapifyDownComparator = isMinHeap ? { $0 < $1 } : { $0 > $1 }
    self.heapifyUpComparator = isMinHeap ? { $0 > $1 } : { $0 < $1 }
  }
  
  public var peek: Element? {
    items.first
  }
  
  public var count: Int {
    items.count
  }
  
  public var isEmpty: Bool {
    items.isEmpty
  }
  
  public mutating func pop() -> Element? {
    if items.isEmpty {
      return nil
    }
    
    // if items contain only one element just remove and return the last one
    if items.count == 1 {
      return items.removeLast()
    }
    
    let item = items.first
    let last = items.removeLast()
    items[.zero] = last
    
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
    var index = Int.zero
    while hasLeftChild(index) {
      var smallChildIndex = leftChildIndex(index)
      
      if hasRightChild(index) && heapifyDownComparator(rightChild(index), leftChild(index)) {
        smallChildIndex = rightChildIndex(index)
      }
      
      if heapifyDownComparator(items[index], items[smallChildIndex]) {
        break
      } else {
        swapElementsAtIndexes(index, smallChildIndex)
      }
      
      index = smallChildIndex
    }
  }
  
  mutating func heapifyUp() {
    var index = items.count - 1
    while hasParent(index) && heapifyUpComparator(parent(index), items[index]) {
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
    parentIndex(index) >= Int.zero
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
