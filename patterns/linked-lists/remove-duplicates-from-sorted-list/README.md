# Remove Duplicates from Sorted List

**Difficulty**: Easy
**Pattern**: linked-lists
**LeetCode**: 83
**Educative**: [Course/Problem Reference]

## Problem Statement
Given the head of a sorted linked list, delete all duplicates such that each element appears only once. Return the linked list sorted as well.

**Example 1:**
- Input: `[1,1,2]`
- Output: `[1,2]`

**Example 2:**
- Input: `[1,1,2,3,3]`
- Output: `[1,2,3]`

**Constraints:**
- The number of nodes in the list is in the range `[0, 300]`
- `-100 <= Node.val <= 100`
- The list is guaranteed to be sorted in ascending order

## Approach
Use a two-pointer technique with `previous` and `current` pointers:

1. Handle edge cases: empty list or single node
2. Initialize `previous = None` and `current = head`
3. Traverse the list:
   - If `previous` exists and `previous.val == current.val`:
     - Remove duplicate by setting `previous.next = current.next`
     - Move `current` to next node
   - Otherwise, advance both pointers
4. Return the modified head

The key insight is that we keep the first occurrence of each value and remove subsequent duplicates by adjusting the `next` pointers.

## Key Insights
- **Two-pointer technique**: Use `previous` and `current` to track adjacent nodes
- **In-place modification**: Modify the existing list structure rather than creating new nodes
- **Edge case handling**: Always check for null nodes before accessing properties
- **Pointer manipulation**: Understanding when to advance pointers vs when to skip nodes
- **Pattern recognition**: This is a classic linked list traversal with conditional node removal
- **Gotchas**:
  - Don't forget to handle empty lists and single nodes
  - Make sure to advance `current` after removing duplicates
  - Be careful with null pointer access

## Complexity
- **Time**: O(n) - single pass through the linked list
- **Space**: O(1) - only using constant extra space for pointers

## Variations & Follow-ups
- **Remove Duplicates from Sorted List II** (LeetCode 82): Remove ALL nodes with duplicate values
- **Remove Duplicates from Unsorted Linked List**: Handle unsorted input
- **What if the list wasn't sorted?** Would need a HashSet to track seen values
- **What if we wanted to keep the last occurrence instead of first?** Reverse, solve, reverse again
- **Follow-up questions**:
  - Can you solve this recursively?
  - How would you handle doubly linked lists?
  - What if memory is extremely limited?

## Related Problems
- **Remove Duplicates from Sorted List II** (LeetCode 82) - Medium
- **Remove Duplicates from Sorted Array** (LeetCode 26) - Easy
- **Remove Duplicates from Sorted Array II** (LeetCode 80) - Medium
- **Remove Duplicates from Unsorted Linked List** - Medium
- **Delete Node in a Linked List** (LeetCode 237) - Easy
- **Remove Linked List Elements** (LeetCode 203) - Easy

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
- **Solution validated**: All 12 test cases pass including edge cases
- **Time complexity**: Confirmed O(n) with single pass
- **Space complexity**: Confirmed O(1) with only pointer variables
- **Key learning**: The importance of proper pointer advancement in linked list problems
- **Common mistake**: Forgetting to check for null before accessing node properties
- **Interview tip**: Always start by handling edge cases (null, single node)
- **Pattern**: This problem exemplifies the "modify in place" approach for linked lists
