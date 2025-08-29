# Linked Lists

## When to Use
- Problems involving sequential data where insertion/deletion is frequent
- When you need to detect cycles or find specific positions (middle, nth from end)
- Merging or partitioning sequential data
- Problems requiring reversal of data order
- When access time is not critical but modification efficiency is important

## Key Insights
- **Two Pointer Technique**: Fast/slow pointers for cycle detection, finding middle, nth from end
- **Dummy Head**: Simplifies edge cases when modifying the head of the list
- **Prev Pointer Tracking**: Essential for reversal and deletion operations
- **Multiple Pass Strategy**: Sometimes easier to traverse multiple times than complex single-pass logic
- **Recursive Thinking**: Many linked list operations have elegant recursive solutions
- **In-place Modification**: Often required to achieve optimal space complexity

## Common Variations
- **Fast & Slow Pointers**: Cycle detection, finding middle node, nth from end
- **Reversal Patterns**: Reverse entire list, reverse in groups, reverse between positions
- **Merge Patterns**: Merge two sorted lists, merge k sorted lists, partition lists
- **Cycle Problems**: Detect cycle, find cycle start, remove cycle
- **Intersection Problems**: Find intersection of two lists, check if lists intersect
- **Deletion Patterns**: Remove nth node, remove duplicates, remove nodes with value
- **Construction Patterns**: Convert array to linked list, deep copy with random pointers

## Implementation Notes
### Python Specific
- Use `None` for null pointers
- Leverage tuple unpacking for elegant pointer swaps: `prev, curr, next_node = curr, next_node, next_node.next`
- List comprehension can help with array-to-linkedlist conversion
- Use `while curr and curr.next` to avoid null pointer issues
```python
# Common ListNode definition
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

# Dummy head pattern
dummy = ListNode(0)
dummy.next = head
```

### Go Specific
- Use `nil` for null pointers
- Pointer dereferencing with `*` when needed
- Be careful with nil pointer dereference - always check before accessing
- Use multiple assignment for clean swaps: `prev, curr = curr, curr.Next`
```go
// Common ListNode definition
type ListNode struct {
    Val  int
    Next *ListNode
}

// Dummy head pattern
dummy := &ListNode{Next: head}
```

### Rust Specific
- Use `Option<Box<ListNode>>` for nullable references
- Pattern matching with `match` and `if let` for Option handling
- `take()` method to move ownership out of Option
- `as_ref()` and `as_mut()` for borrowing from Option
```rust
// Common ListNode definition
#[derive(PartialEq, Eq, Clone, Debug)]
pub struct ListNode {
    pub val: i32,
    pub next: Option<Box<ListNode>>,
}

// Pattern matching
match node.next.as_ref() {
    Some(next_node) => { /* handle next */ },
    None => { /* handle end */ }
}
```

## Time/Space Complexity
- **Traversal**: O(n) time, O(1) space
- **Search**: O(n) time, O(1) space
- **Insertion/Deletion** (at known position): O(1) time, O(1) space
- **Insertion/Deletion** (at unknown position): O(n) time, O(1) space
- **Reversal**: O(n) time, O(1) space iterative, O(n) space recursive
- **Merge Operations**: O(n+m) time, O(1) space for two lists
- **Cycle Detection**: O(n) time, O(1) space with two pointers

## Problems Solved
- [ ] remove-duplicates-from-sorted-list (Easy) - [Link](remove-duplicates-from-sorted-list/)- [ ] Reverse Linked List (Easy) - [206]
- [ ] Merge Two Sorted Lists (Easy) - [21]
- [ ] Linked List Cycle (Easy) - [141]
- [ ] Middle of the Linked List (Easy) - [876]
- [ ] Remove Duplicates from Sorted List (Easy) - [83]
- [ ] Palindrome Linked List (Easy) - [234]
- [ ] Intersection of Two Linked Lists (Easy) - [160]
- [ ] Remove Nth Node From End (Medium) - [19]
- [ ] Add Two Numbers (Medium) - [2]
- [ ] Odd Even Linked List (Medium) - [328]
- [ ] Swap Nodes in Pairs (Medium) - [24]
- [ ] Rotate List (Medium) - [61]
- [ ] Partition List (Medium) - [86]
- [ ] Remove Duplicates from Sorted List II (Medium) - [82]
- [ ] Linked List Cycle II (Medium) - [142]
- [ ] Reorder List (Medium) - [143]
- [ ] Copy List with Random Pointer (Medium) - [138]
- [ ] Reverse Linked List II (Medium) - [92]
- [ ] Sort List (Medium) - [148]
- [ ] Merge k Sorted Lists (Hard) - [23]
- [ ] Reverse Nodes in k-Group (Hard) - [25]

## Resources
- **Educative**: [Grokking Coding Interview Patterns - Two Pointers](https://www.educative.io/courses/grokking-coding-interview-patterns-python/two-pointers)
- **Book Reference**: Cracking the Coding Interview Ch. 2 - Linked Lists
- **neetcode.io**: [Linked List Playlist](https://www.youtube.com/playlist?list=PLot-Xpze53leU0Ec0VkBhnf4npMRFiNcB)
- **Tech Interview Handbook**: [Linked List Cheatsheet](https://www.techinterviewhandbook.org/algorithms/linked-list)
- **LabulaDong**: [Two Pointer Techniques for Linked Lists](https://labuladong.online/algo/en/essential-technique/linked-list-skills-summary/)
