# Middle of the Linked List

**Difficulty**: Easy
**Pattern**: fast-slow-pointers
**Strategy**: tortoise and hare for finding middle
**LeetCode**: 876
**Educative**: [Course/Problem Reference]

## Problem Statement
[LeetCode #876](https://leetcode.com/problems/middle-of-the-linked-list/)

Given the `head` of a singly linked list, return the middle node of the linked list.

If there are two middle nodes, return the second middle node.

Example 1:
Input: head = [1,2,3,4,5]
Output: [3,4,5]
Explanation: The middle node of the list is node 3.

Example 2:
Input: head = [1,2,3,4,5,6]
Output: [4,5,6]
Explanation: Since the list has two middle nodes with values 3 and 4, we return the second one.

## Approach
1. Use **fast-slow pointer technique** (tortoise and hare)
2. Initialize two pointers: `slow` and `fast`, both starting at `head`
3. Move `slow` one step at a time and `fast` two steps at a time
4. When `fast` reaches the end (or becomes `null`), `slow` will be at the middle
5. Return the node at `slow` pointer

**Why it works**: When fast pointer moves twice as fast, by the time it reaches the end, slow pointer will be exactly at the middle.

Alternative approach:
- **Two-pass solution**: First pass to count nodes, second pass to find middle (less efficient)

## Key Insights
- **Single pass solution**: Find middle in one traversal without knowing list length
- **Fast pointer conditions**: Check both `fast` and `fast.next` for null
- **Even vs odd length**: For even length, returns the second middle node
- **No extra space**: Only uses two pointers
- **Mathematical relationship**: slow moves n/2 steps when fast moves n steps
- **Pattern recognition**: Classic use of fast-slow pointers for finding middle element

## Complexity
- **Time**: O(n) - single pass through the linked list
- **Space**: O(1) - only using two pointer variables

## Variations & Follow-ups
- **Return first middle for even length**: Stop fast pointer one step earlier
- **Find kth node from middle**: Extend the concept
- **Middle of circular linked list**: Requires cycle detection first
- **Nth node from end**: Similar technique with different starting positions
- **Delete middle node**: Combine with deletion logic

## Related Problems
- [Remove Nth Node From End of List (19)](https://leetcode.com/problems/remove-nth-node-from-end-of-list/)
- [Linked List Cycle (141)](https://leetcode.com/problems/linked-list-cycle/)
- [Palindrome Linked List (234)](https://leetcode.com/problems/palindrome-linked-list/)
- [Reorder List (143)](https://leetcode.com/problems/reorder-list/)

## Progress Checklist
- [ ] Understood the pattern
- [ ] Solved without hints (Go)
- [ ] Solved without hints (Rust)
- [ ] Solved without hints (Python)
- [ ] Optimized solution
- [ ] Can explain clearly
- [ ] Solved under time pressure
- [ ] Reviewed spaced repetition

## Notes
### Educative Insights
[Notes from AI Code Mentor, visualizations, etc.]

### neetcode.io Notes
[Video explanation insights, alternative approaches]

### Personal Notes
[Your own insights, mistakes made, things to remember]
