# K-Way Merge Pattern

## When to Use
- Problems involving merging K sorted data structures (arrays, linked lists, etc.)
- Need to find smallest/largest elements from multiple sorted sources
- Problems requiring maintaining sorted order while processing multiple inputs
- Streaming data from multiple sorted sources
- Finding Kth smallest element across multiple sorted arrays

## Key Insights
- Use min-heap (priority queue) to efficiently track smallest elements from each source
- Always process the smallest available element across all K sources
- Keep track of which source each element came from
- Replace processed elements with next element from same source
- Heap size remains constant at K (one element from each source)

## Common Variations
- **Merge K Sorted Lists**: Merge K sorted linked lists into one sorted list
- **Kth Smallest in Sorted Matrix**: Find Kth smallest element in row/column sorted matrix
- **Smallest Range**: Find smallest range covering at least one element from each array
- **Merge K Sorted Arrays**: Combine multiple sorted arrays into one
- **Find Median from Data Stream**: Maintain median while streaming from multiple sources

## Implementation Notes
### Python Specific
```python
import heapq

# Merge K sorted linked lists
def merge_k_lists(lists):
    if not lists:
        return None

    # Min-heap: (value, list_index, node)
    heap = []

    # Initialize heap with first node from each list
    for i, head in enumerate(lists):
        if head:
            heapq.heappush(heap, (head.val, i, head))

    dummy = ListNode(0)
    current = dummy

    while heap:
        val, list_idx, node = heapq.heappop(heap)

        current.next = node
        current = current.next

        # Add next node from the same list
        if node.next:
            heapq.heappush(heap, (node.next.val, list_idx, node.next))

    return dummy.next

# Kth smallest in sorted matrix
def kth_smallest_in_matrix(matrix, k):
    n = len(matrix)
    heap = []

    # Initialize heap with first element from each row
    for i in range(min(k, n)):
        heapq.heappush(heap, (matrix[i][0], i, 0))

    count = 0
    while heap:
        val, row, col = heapq.heappop(heap)
        count += 1

        if count == k:
            return val

        # Add next element from the same row
        if col + 1 < len(matrix[row]):
            heapq.heappush(heap, (matrix[row][col + 1], row, col + 1))

    return -1
```

### Go Specific
```go
import (
    "container/heap"
)

// Element in heap for K-way merge
type HeapElement struct {
    Value int
    ListIndex int
    Node *ListNode
}

// MinHeap implementation
type MinHeap []HeapElement

func (h MinHeap) Len() int { return len(h) }
func (h MinHeap) Less(i, j int) bool { return h[i].Value < h[j].Value }
func (h MinHeap) Swap(i, j int) { h[i], h[j] = h[j], h[i] }

func (h *MinHeap) Push(x interface{}) {
    *h = append(*h, x.(HeapElement))
}

func (h *MinHeap) Pop() interface{} {
    old := *h
    n := len(old)
    x := old[n-1]
    *h = old[0 : n-1]
    return x
}

// Merge K sorted lists
func mergeKLists(lists []*ListNode) *ListNode {
    if len(lists) == 0 {
        return nil
    }

    minHeap := &MinHeap{}
    heap.Init(minHeap)

    // Initialize heap with first node from each list
    for i, head := range lists {
        if head != nil {
            heap.Push(minHeap, HeapElement{
                Value: head.Val,
                ListIndex: i,
                Node: head,
            })
        }
    }

    dummy := &ListNode{}
    current := dummy

    for minHeap.Len() > 0 {
        element := heap.Pop(minHeap).(HeapElement)

        current.Next = element.Node
        current = current.Next

        // Add next node from the same list
        if element.Node.Next != nil {
            heap.Push(minHeap, HeapElement{
                Value: element.Node.Next.Val,
                ListIndex: element.ListIndex,
                Node: element.Node.Next,
            })
        }
    }

    return dummy.Next
}

// Find smallest range covering elements from all K arrays
func smallestRange(nums [][]int) []int {
    minHeap := &MinHeap{}
    heap.Init(minHeap)

    maxVal := nums[0][0]

    // Initialize heap with first element from each array
    for i, arr := range nums {
        heap.Push(minHeap, HeapElement{
            Value: arr[0],
            ListIndex: i,
            // Use Node field to store column index
        })
        if arr[0] > maxVal {
            maxVal = arr[0]
        }
    }

    rangeStart, rangeEnd := 0, math.MaxInt32
    indices := make([]int, len(nums))

    for minHeap.Len() == len(nums) {
        element := heap.Pop(minHeap).(HeapElement)
        minVal := element.Value
        listIdx := element.ListIndex

        // Update range if current is smaller
        if maxVal - minVal < rangeEnd - rangeStart {
            rangeStart = minVal
            rangeEnd = maxVal
        }

        // Move to next element in the same array
        indices[listIdx]++
        if indices[listIdx] < len(nums[listIdx]) {
            nextVal := nums[listIdx][indices[listIdx]]
            heap.Push(minHeap, HeapElement{
                Value: nextVal,
                ListIndex: listIdx,
            })
            if nextVal > maxVal {
                maxVal = nextVal
            }
        }
    }

    return []int{rangeStart, rangeEnd}
}
```

### Rust Specific
```rust
use std::collections::BinaryHeap;
use std::cmp::Reverse;

// Element for heap in K-way merge
#[derive(Debug, Eq, PartialEq)]
struct HeapElement {
    value: i32,
    list_index: usize,
    element_index: usize,
}

impl Ord for HeapElement {
    fn cmp(&self, other: &Self) -> std::cmp::Ordering {
        // Reverse for min-heap behavior
        other.value.cmp(&self.value)
    }
}

impl PartialOrd for HeapElement {
    fn partial_cmp(&self, other: &Self) -> Option<std::cmp::Ordering> {
        Some(self.cmp(other))
    }
}

// Merge K sorted arrays
fn merge_k_arrays(arrays: Vec<Vec<i32>>) -> Vec<i32> {
    let mut heap = BinaryHeap::new();
    let mut result = Vec::new();

    // Initialize heap with first element from each array
    for (i, arr) in arrays.iter().enumerate() {
        if !arr.is_empty() {
            heap.push(HeapElement {
                value: arr[0],
                list_index: i,
                element_index: 0,
            });
        }
    }

    while let Some(element) = heap.pop() {
        result.push(element.value);

        // Add next element from the same array
        let next_index = element.element_index + 1;
        if next_index < arrays[element.list_index].len() {
            heap.push(HeapElement {
                value: arrays[element.list_index][next_index],
                list_index: element.list_index,
                element_index: next_index,
            });
        }
    }

    result
}

// Kth smallest element in sorted matrix
fn kth_smallest_in_matrix(matrix: Vec<Vec<i32>>, k: i32) -> i32 {
    let mut heap = BinaryHeap::new();
    let n = matrix.len();
    let m = matrix[0].len();

    // Initialize heap with first column elements
    for i in 0..std::cmp::min(k as usize, n) {
        heap.push(Reverse(HeapElement {
            value: matrix[i][0],
            list_index: i,
            element_index: 0,
        }));
    }

    let mut count = 0;
    while let Some(Reverse(element)) = heap.pop() {
        count += 1;
        if count == k {
            return element.value;
        }

        // Add next element from the same row
        let next_col = element.element_index + 1;
        if next_col < m {
            heap.push(Reverse(HeapElement {
                value: matrix[element.list_index][next_col],
                list_index: element.list_index,
                element_index: next_col,
            }));
        }
    }

    -1
}
```

## Time/Space Complexity
- **Time**: O(N log K) where N is total number of elements and K is number of sources
- **Space**: O(K) for the heap storing one element from each source
- **Heap operations**: O(log K) for each push/pop operation

## Problems Solved
- [ ] Problem 1 (Hard) - [Link to folder]
- [ ] Problem 2 (Hard) - [Link to folder]
- [ ] Problem 3 (Hard) - [Link to folder]

## Resources
- **Educative**: Grokking Coding Interview - K-Way Merge
- **Book Reference**: CLRS Chapter 6 - Heapsort
- **neetcode.io**: Heap / Priority Queue playlist
