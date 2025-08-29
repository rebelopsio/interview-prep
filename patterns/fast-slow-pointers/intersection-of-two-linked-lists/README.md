# Intersection of Two Linked Lists

**Difficulty**: Easy
**Pattern**: fast-slow-pointers
**Strategy**: two-pointer traversal with list switching
**LeetCode**: 160
**Neetcode**: [Intersection of Two Linked Lists](https://neetcode.io/problems/intersection-of-two-linked-lists)
**Educative**: [Course/Problem Reference]

## Problem Statement
[LeetCode #160](https://leetcode.com/problems/intersection-of-two-linked-lists/)

Given the heads of two singly linked-lists headA and headB, return the node at which the two lists intersect. If the two linked lists have no intersection at all, return null.

For the purpose of this problem, assume that the linked lists do not contain cycles.

Example 1:
Input: intersectVal = 8, listA = [4,1,8,4,5], listB = [5,6,1,8,4,5], skipA = 2, skipB = 3
Output: Reference to the node with value = 8

The lists intersect at the node with value 8.

## Approach
1. Use **two-pointer technique** with pointer switching strategy
2. Initialize two pointers: `pA` at `headA` and `pB` at `headB`
3. Traverse both lists simultaneously:
   - When `pA` reaches end of list A, redirect to `headB`
   - When `pB` reaches end of list B, redirect to `headA`
4. If intersection exists, both pointers will meet at the intersection node
5. If no intersection, both pointers will be `null` at the same time

**Why this works**: By switching lists, both pointers travel the same total distance (len(A) + len(B)), ensuring they align at the intersection point.

Alternative approaches:
- **Hash set**: Store all nodes from one list, check if any node from other list exists
- **Length calculation**: Find lengths, align shorter list, then traverse together

## Key Insights
- **Equal path lengths**: Switching lists creates equal-length paths for both pointers
- **Synchronization**: Both pointers will be at same relative position after switching
- **No extra space needed**: Achieves O(1) space complexity unlike hash set approach
- **Handles different lengths**: Works regardless of list length differences
- **Null handling**: If no intersection, both pointers reach null simultaneously
- **Pattern recognition**: When dealing with two sequences of different lengths, consider making them equal length through concatenation or switching

## Complexity
- **Time**: O(m + n)
- **Space**: O(1)

## Variations & Follow-ups
- **What if lists had cycles?**: Would need cycle detection first
- **Find intersection in arrays**: Similar concept with indices
- **Multiple list intersection**: Extend to more than two lists
- **Return intersection length**: Count nodes from intersection to end
- **Merge point in Y-shaped structure**: Same problem in different context

## Related Problems
- [Linked List Cycle (141)](https://leetcode.com/problems/linked-list-cycle/)
- [Linked List Cycle II (142)](https://leetcode.com/problems/linked-list-cycle-ii/)
- [Remove Nth Node From End of List (19)](https://leetcode.com/problems/remove-nth-node-from-end-of-list/)
- [Merge Two Sorted Lists (21)](https://leetcode.com/problems/merge-two-sorted-lists/)

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
