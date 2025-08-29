# Linked List Cycle

**Difficulty**: Easy
**Pattern**: fast-slow-pointers
**Strategy**: Floyd's cycle detection (tortoise and hare)
**LeetCode**: 141
**Educative**: [Course/Problem Reference]

## Problem Statement
[LeetCode #141](https://leetcode.com/problems/linked-list-cycle/)

Given `head`, the head of a linked list, determine if the linked list has a cycle in it.

There is a cycle in a linked list if there is some node in the list that can be reached again by continuously following the `next` pointer. Internally, `pos` is used to denote the index of the node that tail's `next` pointer is connected to. **Note that `pos` is not passed as a parameter**.

Return `true` if there is a cycle in the linked list. Otherwise, return `false`.

Example 1:
Input: head = [3,2,0,-4], pos = 1
Output: true
Explanation: There is a cycle in the linked list, where the tail connects to the 1st node (0-indexed).

Example 2:
Input: head = [1,2], pos = 0
Output: true
Explanation: There is a cycle in the linked list, where the tail connects to the 0th node.

Example 3:
Input: head = [1], pos = -1
Output: false
Explanation: There is no cycle in the linked list.

## Approach
1. Use **Floyd's cycle detection algorithm** (tortoise and hare)
2. Initialize two pointers: `slow` (moves 1 step) and `fast` (moves 2 steps)
3. Traverse the list:
   - Move `slow` pointer one step forward
   - Move `fast` pointer two steps forward
   - If `fast` or `fast.next` becomes `null`, no cycle exists
   - If `slow` and `fast` meet, cycle exists
4. Return `true` if pointers meet, `false` if fast reaches end

**Why it works**: If there's a cycle, the faster pointer will eventually "lap" the slower pointer within the cycle.

## Key Insights
- **Two-speed traversal**: Fast pointer moves twice as fast as slow pointer
- **Cycle guarantee**: If cycle exists, fast will eventually catch up to slow
- **No extra space**: Only uses two pointers, no hash set or visited markers
- **Mathematical proof**: In a cycle of length `k`, fast pointer gains 1 position per iteration on slow pointer
- **Edge cases**: Handle empty list and single node
- **Pattern recognition**: Classic application of fast-slow pointers for cycle detection

## Complexity
- **Time**: O(n) - In worst case, we visit each node at most twice
- **Space**: O(1) - Only using two pointer variables

## Variations & Follow-ups
- **Linked List Cycle II**: Find the starting node of the cycle
- **Cycle length**: How many nodes are in the cycle?
- **Cycle detection in arrays**: Using indices as "next" pointers
- **Multiple cycles**: What if there could be multiple cycles?
- **Find all cycles**: In a more complex graph structure

## Related Problems
- [Linked List Cycle II (142)](https://leetcode.com/problems/linked-list-cycle-ii/)
- [Happy Number (202)](https://leetcode.com/problems/happy-number/)
- [Find the Duplicate Number (287)](https://leetcode.com/problems/find-the-duplicate-number/)
- [Intersection of Two Linked Lists (160)](https://leetcode.com/problems/intersection-of-two-linked-lists/)

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
