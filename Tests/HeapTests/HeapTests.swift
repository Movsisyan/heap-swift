import XCTest
@testable import Heap

final class HeapTests: XCTestCase {
  
  func test_containsNoElementOnInitialization() {
    let heap = Heap<Int>()
    
    XCTAssertTrue(heap.isEmpty, "Heap must be empty after initilization")
  }
  
  func test_PeekElementOnEmptyHeap_shouldReturnNil() {
    let heap = Heap<Int>()
    
    XCTAssertNil(heap.peek, "Empty heap must return nil on peek")
  }
}
