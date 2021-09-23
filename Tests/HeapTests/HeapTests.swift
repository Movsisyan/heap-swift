import XCTest
@testable import Heap

final class HeapTests: XCTestCase {
  
  func testContainsNoElementOnInitialization() {
    let heap = Heap<Int>()
    
    XCTAssertTrue(heap.isEmpty, <#T##message: String##String#>)
  }
}
