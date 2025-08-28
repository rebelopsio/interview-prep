# Top K Elements Pattern

## When to Use
- Problems asking for the top K largest, smallest, or most frequent elements
- Need to find K elements with specific properties from a large dataset
- Optimization problems where you only care about the best K solutions
- Problems involving heaps, priority queues, or partial sorting
- When full sorting would be overkill (O(n log n) vs O(n log k))

## Key Insights
- Use heap (priority queue) to maintain K elements efficiently
- Min-heap for finding K largest elements, max-heap for K smallest
- For frequency problems, combine hash map with heap
- Quick Select algorithm can find Kth element in O(n) average time
- Heap operations are O(log k) which is better than O(log n) for large datasets

## Common Variations
- **Kth Largest Element**: Find the Kth largest element in array
- **Top K Frequent Elements**: Find K most frequently occurring elements
- **K Closest Points**: Find K points closest to origin
- **Kth Smallest in BST**: Find Kth smallest element in binary search tree
- **Merge K Sorted Lists**: Merge K sorted linked lists using heap
- **Sliding Window Maximum**: Find maximum in each sliding window of size K

## Implementation Notes
### Python Specific
```python
import heapq
from collections import Counter

# Find K largest elements using min-heap
def find_k_largest(nums, k):
    min_heap = []

    for num in nums:
        heapq.heappush(min_heap, num)
        if len(min_heap) > k:
            heapq.heappop(min_heap)

    return min_heap

# Top K frequent elements
def top_k_frequent(nums, k):
    count = Counter(nums)
    # Use negative frequency for max-heap behavior
    heap = [(-freq, num) for num, freq in count.items()]
    heapq.heapify(heap)

    result = []
    for _ in range(k):
        freq, num = heapq.heappop(heap)
        result.append(num)

    return result

# Kth largest using quickselect
def find_kth_largest(nums, k):
    def quickselect(left, right, k_smallest):
        pivot_index = partition(left, right)

        if k_smallest == pivot_index:
            return nums[pivot_index]
        elif k_smallest < pivot_index:
            return quickselect(left, pivot_index - 1, k_smallest)
        else:
            return quickselect(pivot_index + 1, right, k_smallest)

    def partition(left, right):
        pivot = nums[right]
        i = left

        for j in range(left, right):
            if nums[j] <= pivot:
                nums[i], nums[j] = nums[j], nums[i]
                i += 1

        nums[i], nums[right] = nums[right], nums[i]
        return i

    return quickselect(0, len(nums) - 1, len(nums) - k)
```

### Go Specific
```go
import (
    "container/heap"
    "sort"
)

// IntHeap for implementing heap interface
type IntHeap []int

func (h IntHeap) Len() int           { return len(h) }
func (h IntHeap) Less(i, j int) bool { return h[i] < h[j] } // Min-heap
func (h IntHeap) Swap(i, j int)      { h[i], h[j] = h[j], h[i] }

func (h *IntHeap) Push(x interface{}) {
    *h = append(*h, x.(int))
}

func (h *IntHeap) Pop() interface{} {
    old := *h
    n := len(old)
    x := old[n-1]
    *h = old[0 : n-1]
    return x
}

// Find K largest elements
func findKLargest(nums []int, k int) []int {
    h := &IntHeap{}
    heap.Init(h)

    for _, num := range nums {
        heap.Push(h, num)
        if h.Len() > k {
            heap.Pop(h)
        }
    }

    result := make([]int, h.Len())
    for i := 0; i < len(result); i++ {
        result[i] = (*h)[i]
    }

    return result
}

// Kth largest element using quickselect
func findKthLargest(nums []int, k int) int {
    return quickSelect(nums, 0, len(nums)-1, len(nums)-k)
}

func quickSelect(nums []int, left, right, k int) int {
    if left == right {
        return nums[left]
    }

    pivotIndex := partition(nums, left, right)

    if k == pivotIndex {
        return nums[k]
    } else if k < pivotIndex {
        return quickSelect(nums, left, pivotIndex-1, k)
    } else {
        return quickSelect(nums, pivotIndex+1, right, k)
    }
}

func partition(nums []int, left, right int) int {
    pivot := nums[right]
    i := left

    for j := left; j < right; j++ {
        if nums[j] <= pivot {
            nums[i], nums[j] = nums[j], nums[i]
            i++
        }
    }

    nums[i], nums[right] = nums[right], nums[i]
    return i
}
```

### Rust Specific
```rust
use std::collections::{BinaryHeap, HashMap};
use std::cmp::Reverse;

// Find K largest elements using min-heap
fn find_k_largest(nums: Vec<i32>, k: usize) -> Vec<i32> {
    let mut min_heap = BinaryHeap::new();

    for num in nums {
        min_heap.push(Reverse(num));
        if min_heap.len() > k {
            min_heap.pop();
        }
    }

    min_heap.into_iter().map(|Reverse(x)| x).collect()
}

// Top K frequent elements
fn top_k_frequent(nums: Vec<i32>, k: i32) -> Vec<i32> {
    let mut count: HashMap<i32, i32> = HashMap::new();

    for num in nums {
        *count.entry(num).or_insert(0) += 1;
    }

    let mut heap = BinaryHeap::new();

    for (num, freq) in count {
        heap.push((freq, num));
    }

    let mut result = Vec::new();
    for _ in 0..k {
        if let Some((_, num)) = heap.pop() {
            result.push(num);
        }
    }

    result
}

// Kth largest using quickselect
fn find_kth_largest(mut nums: Vec<i32>, k: i32) -> i32 {
    let k = (nums.len() - k as usize) as i32;
    quick_select(&mut nums, 0, nums.len() as i32 - 1, k)
}

fn quick_select(nums: &mut [i32], left: i32, right: i32, k: i32) -> i32 {
    if left == right {
        return nums[left as usize];
    }

    let pivot_index = partition(nums, left, right);

    if k == pivot_index {
        nums[k as usize]
    } else if k < pivot_index {
        quick_select(nums, left, pivot_index - 1, k)
    } else {
        quick_select(nums, pivot_index + 1, right, k)
    }
}

fn partition(nums: &mut [i32], left: i32, right: i32) -> i32 {
    let pivot = nums[right as usize];
    let mut i = left;

    for j in left..right {
        if nums[j as usize] <= pivot {
            nums.swap(i as usize, j as usize);
            i += 1;
        }
    }

    nums.swap(i as usize, right as usize);
    i
}
```

## Time/Space Complexity
- **Heap approach**: Time O(n log k), Space O(k)
- **QuickSelect approach**: Time O(n) average, O(n²) worst case, Space O(1)
- **Sorting approach**: Time O(n log n), Space O(1) or O(n)

## Problems Solved
- [ ] Problem 1 (Medium) - [Link to folder]
- [ ] Problem 2 (Medium) - [Link to folder]
- [ ] Problem 3 (Hard) - [Link to folder]

## Resources
- **Educative**: Grokking Coding Interview - Top K Elements
- **Book Reference**: CLRS Chapter 6 - Heapsort
- **neetcode.io**: Heap / Priority Queue playlist
