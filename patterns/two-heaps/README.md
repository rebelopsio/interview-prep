# Two Heaps Pattern

## When to Use
- Problems requiring access to both smallest and largest elements efficiently
- Finding median in a dynamic dataset or stream of numbers
- Partitioning data into two halves with specific size constraints
- Problems involving "sliding window median" or dynamic percentiles
- Need to maintain balance between two groups of elements

## Key Insights
- Use max-heap for smaller half and min-heap for larger half of elements
- Keep heaps balanced: size difference should never exceed 1
- Median is either top of one heap (odd total) or average of both tops (even total)
- Always add to heap that maintains balance, then rebalance if necessary
- Can extend pattern to find any percentile, not just median

## Common Variations
- **Find Median from Data Stream**: Maintain median as numbers are added
- **Sliding Window Median**: Find median in each sliding window
- **IPO Problem**: Maximize capital by selecting projects optimally
- **Next Interval**: Find next larger interval for each interval
- **Maximize Capital**: Select best projects to maximize final capital

## Implementation Notes
### Python Specific
```python
import heapq

class MedianFinder:
    def __init__(self):
        # Max heap for smaller half (negate values for max behavior)
        self.small = []
        # Min heap for larger half
        self.large = []

    def addNum(self, num):
        # Add to small heap first
        heapq.heappush(self.small, -num)

        # Balance: move largest from small to large
        if self.small and self.large and (-self.small[0] > self.large[0]):
            val = -heapq.heappop(self.small)
            heapq.heappush(self.large, val)

        # Balance sizes
        if len(self.small) > len(self.large) + 1:
            val = -heapq.heappop(self.small)
            heapq.heappush(self.large, val)
        if len(self.large) > len(self.small) + 1:
            val = heapq.heappop(self.large)
            heapq.heappush(self.small, -val)

    def findMedian(self):
        if len(self.small) > len(self.large):
            return -self.small[0]
        if len(self.large) > len(self.small):
            return self.large[0]
        return (-self.small[0] + self.large[0]) / 2

# Sliding window median
def median_sliding_window(nums, k):
    def get_median(window):
        sorted_window = sorted(window)
        n = len(sorted_window)
        if n % 2 == 1:
            return sorted_window[n // 2]
        return (sorted_window[n // 2 - 1] + sorted_window[n // 2]) / 2

    result = []
    window = []

    for i in range(len(nums)):
        window.append(nums[i])

        if len(window) > k:
            window.pop(0)

        if len(window) == k:
            result.append(get_median(window))

    return result
```

### Go Specific
```go
import (
    "container/heap"
)

// Max heap implementation
type MaxHeap []int
func (h MaxHeap) Len() int { return len(h) }
func (h MaxHeap) Less(i, j int) bool { return h[i] > h[j] }
func (h MaxHeap) Swap(i, j int) { h[i], h[j] = h[j], h[i] }
func (h *MaxHeap) Push(x interface{}) { *h = append(*h, x.(int)) }
func (h *MaxHeap) Pop() interface{} {
    old := *h
    n := len(old)
    x := old[n-1]
    *h = old[0 : n-1]
    return x
}

// Min heap implementation
type MinHeap []int
func (h MinHeap) Len() int { return len(h) }
func (h MinHeap) Less(i, j int) bool { return h[i] < h[j] }
func (h MinHeap) Swap(i, j int) { h[i], h[j] = h[j], h[i] }
func (h *MinHeap) Push(x interface{}) { *h = append(*h, x.(int)) }
func (h *MinHeap) Pop() interface{} {
    old := *h
    n := len(old)
    x := old[n-1]
    *h = old[0 : n-1]
    return x
}

// MedianFinder using two heaps
type MedianFinder struct {
    small *MaxHeap  // smaller half
    large *MinHeap  // larger half
}

func Constructor() MedianFinder {
    small := &MaxHeap{}
    large := &MinHeap{}
    heap.Init(small)
    heap.Init(large)

    return MedianFinder{small: small, large: large}
}

func (mf *MedianFinder) AddNum(num int) {
    heap.Push(mf.small, num)

    // Balance heaps
    if mf.small.Len() > 0 && mf.large.Len() > 0 &&
       (*mf.small)[0] > (*mf.large)[0] {
        val := heap.Pop(mf.small).(int)
        heap.Push(mf.large, val)
    }

    // Balance sizes
    if mf.small.Len() > mf.large.Len() + 1 {
        val := heap.Pop(mf.small).(int)
        heap.Push(mf.large, val)
    }
    if mf.large.Len() > mf.small.Len() + 1 {
        val := heap.Pop(mf.large).(int)
        heap.Push(mf.small, val)
    }
}

func (mf *MedianFinder) FindMedian() float64 {
    if mf.small.Len() > mf.large.Len() {
        return float64((*mf.small)[0])
    }
    if mf.large.Len() > mf.small.Len() {
        return float64((*mf.large)[0])
    }
    return float64((*mf.small)[0] + (*mf.large)[0]) / 2.0
}
```

### Rust Specific
```rust
use std::collections::BinaryHeap;
use std::cmp::Reverse;

struct MedianFinder {
    small: BinaryHeap<i32>,           // max heap for smaller half
    large: BinaryHeap<Reverse<i32>>,  // min heap for larger half
}

impl MedianFinder {
    fn new() -> Self {
        MedianFinder {
            small: BinaryHeap::new(),
            large: BinaryHeap::new(),
        }
    }

    fn add_num(&mut self, num: i32) {
        self.small.push(num);

        // Balance heaps - move max from small to large
        if let (Some(&max_small), Some(&Reverse(min_large))) =
           (self.small.peek(), self.large.peek()) {
            if max_small > min_large {
                let val = self.small.pop().unwrap();
                self.large.push(Reverse(val));
            }
        }

        // Balance sizes
        if self.small.len() > self.large.len() + 1 {
            let val = self.small.pop().unwrap();
            self.large.push(Reverse(val));
        }
        if self.large.len() > self.small.len() + 1 {
            let Reverse(val) = self.large.pop().unwrap();
            self.small.push(val);
        }
    }

    fn find_median(&self) -> f64 {
        match (self.small.len(), self.large.len()) {
            (s, l) if s > l => *self.small.peek().unwrap() as f64,
            (s, l) if l > s => self.large.peek().unwrap().0 as f64,
            _ => {
                let small_top = *self.small.peek().unwrap() as f64;
                let large_top = self.large.peek().unwrap().0 as f64;
                (small_top + large_top) / 2.0
            }
        }
    }
}

// Find median in sliding window
fn median_sliding_window(nums: Vec<i32>, k: i32) -> Vec<f64> {
    let k = k as usize;
    let mut result = Vec::new();

    for i in 0..=nums.len().saturating_sub(k) {
        let mut window: Vec<i32> = nums[i..i+k].to_vec();
        window.sort();

        let median = if k % 2 == 1 {
            window[k / 2] as f64
        } else {
            (window[k / 2 - 1] + window[k / 2]) as f64 / 2.0
        };

        result.push(median);
    }

    result
}
```

## Time/Space Complexity
- **Add Number**: O(log n) for heap operations
- **Find Median**: O(1) to peek at heap tops
- **Space**: O(n) to store all numbers in heaps
- **Overall**: Efficiently maintains median with O(log n) insertions

## Problems Solved
- [ ] Problem 1 (Hard) - [Link to folder]
- [ ] Problem 2 (Hard) - [Link to folder]
- [ ] Problem 3 (Hard) - [Link to folder]

## Resources
- **Educative**: Grokking Coding Interview - Two Heaps
- **Book Reference**: CLRS Chapter 6 - Heapsort
- **neetcode.io**: Heap / Priority Queue playlist
