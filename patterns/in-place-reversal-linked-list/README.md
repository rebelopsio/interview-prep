# In-Place Reversal of Linked List Pattern

## When to Use
- Problems requiring reversal of a linked list or parts of it
- Need to reverse nodes in groups or specific positions
- Swapping or rearranging nodes without extra space
- Problems involving palindromic linked lists
- Rotating or shifting linked list elements

## Key Insights
- Use three pointers: previous, current, and next to reverse links
- Reverse direction of pointers while traversing the list
- Keep track of connections to maintain list integrity
- Can reverse entire list or specific portions (sublist reversal)
- Essential for many linked list manipulation problems

## Common Variations
- **Reverse Entire List**: Reverse all nodes in linked list
- **Reverse Sublist**: Reverse nodes between two given positions
- **Reverse in Groups**: Reverse every k nodes in the list
- **Reverse Alternating Groups**: Reverse every other group of k nodes
- **Palindrome Check**: Check if linked list reads same forwards and backwards

## Implementation Notes
### Python Specific
```python
# Basic linked list reversal
def reverse_linked_list(head):
    prev = None
    current = head

    while current:
        next_temp = current.next
        current.next = prev
        prev = current
        current = next_temp

    return prev

# Reverse sublist from position m to n
def reverse_sublist(head, m, n):
    if m == n:
        return head

    # Skip first m-1 nodes
    current = head
    prev = None
    for _ in range(m - 1):
        prev = current
        current = current.next

    # Remember connection points
    last_node_first_part = prev
    last_node_sub_list = current

    # Reverse sublist
    for _ in range(n - m + 1):
        next_temp = current.next
        current.next = prev
        prev = current
        current = next_temp

    # Connect with remaining list
    if last_node_first_part:
        last_node_first_part.next = prev
    else:
        head = prev

    last_node_sub_list.next = current
    return head
```

### Go Specific
```go
// ListNode definition
type ListNode struct {
    Val  int
    Next *ListNode
}

// Reverse entire linked list
func reverseList(head *ListNode) *ListNode {
    var prev *ListNode
    current := head

    for current != nil {
        nextTemp := current.Next
        current.Next = prev
        prev = current
        current = nextTemp
    }

    return prev
}

// Reverse in groups of k
func reverseKGroup(head *ListNode, k int) *ListNode {
    if head == nil || k == 1 {
        return head
    }

    // Check if we have k nodes left
    count := 0
    current := head
    for count < k && current != nil {
        current = current.Next
        count++
    }

    if count == k {
        current = reverseKGroup(current, k)

        // Reverse current k-group
        for count > 0 {
            nextTemp := head.Next
            head.Next = current
            current = head
            head = nextTemp
            count--
        }
        head = current
    }

    return head
}
```

### Rust Specific
```rust
// Definition for singly-linked list
#[derive(PartialEq, Eq, Clone, Debug)]
pub struct ListNode {
    pub val: i32,
    pub next: Option<Box<ListNode>>,
}

// Reverse entire linked list
fn reverse_list(head: Option<Box<ListNode>>) -> Option<Box<ListNode>> {
    let mut prev = None;
    let mut current = head;

    while let Some(mut node) = current {
        let next = node.next.take();
        node.next = prev;
        prev = Some(node);
        current = next;
    }

    prev
}

// Helper function to get list length
fn get_length(head: &Option<Box<ListNode>>) -> usize {
    let mut count = 0;
    let mut current = head.as_ref();

    while let Some(node) = current {
        count += 1;
        current = node.next.as_ref();
    }

    count
}
```

## Time/Space Complexity
- **Time**: O(n) where n is the number of nodes to reverse
- **Space**: O(1) for iterative approach, O(n) for recursive due to call stack

## Problems Solved
- [ ] Problem 1 (Easy) - [Link to folder]
- [ ] Problem 2 (Medium) - [Link to folder]
- [ ] Problem 3 (Hard) - [Link to folder]

## Resources
- **Educative**: Grokking Coding Interview - In-place Reversal of LinkedList
- **Book Reference**: Linked List fundamentals
- **neetcode.io**: Linked List playlist
