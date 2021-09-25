# Heap

This is an implementation of a binary heap in Swift

It is a generic `struct` with a public initializer that allows defining a type of heap (min/max).
Example `Heap<Int>(isMinHeap: false)`. 
The default option with an empty parameter is a min-heap.

The API of a Heap
* `count: Int` computed property that returns a number of items. Time complexity O(1)
* `isEmpty: Bool` computed property that returns empty status. Time complexity O(1)
* `peek: Element?`computed property that returns the top(min/max depends on a heap type) item. Time complexity O(1)
* `push(_ item: Element)` the method that inserts a new item into the heap. Time complexity 0(log(n))
* `pop() -> Element?` the method that removes and returns the top(min/max depends on a heap type) item. Time complexity 0(log(n))

