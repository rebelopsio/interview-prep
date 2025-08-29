# Merge Sorted Array

**Difficulty**: Easy
**Pattern**: two-pointers
**Strategy**: reverse traversal
**LeetCode**: 88
**Educative**: [Course/Problem Reference]

## Problem Statement
[LeetCode #88](https://leetcode.com/problems/merge-sorted-array/)

You are given two integer arrays `nums1` and `nums2`, sorted in non-decreasing order, and two integers `m` and `n`, representing the number of elements in `nums1` and `nums2` respectively.

Merge `nums1` and `nums2` into a single array sorted in non-decreasing order.

The final sorted array should not be returned by the function, but instead be stored inside the array `nums1`. To accommodate this, `nums1` has a length of `m + n`, where the first `m` elements denote the elements that should be merged, and the last `n` elements are set to 0 and should be ignored. `nums2` has a length of `n`.

## Approach
Use a **reverse two-pointer approach** to merge from the end:

1. Start with three pointers: one at the end of `nums1` (position `m+n-1`), one at the last valid element of `nums1` (position `m-1`), and one at the last element of `nums2` (position `n-1`)
2. Compare elements from the end of both arrays and place the larger element at the end of `nums1`
3. Move the corresponding pointer backwards after each placement
4. Continue until all elements from `nums2` are merged

This approach works backwards to avoid overwriting unprocessed elements in `nums1`.

## Key Insights
- **Merge from the back**: Start from the end to avoid overwriting unprocessed elements
- **Three pointers needed**: End position, nums1 current, nums2 current
- **Handle remaining elements**: After main loop, only need to copy remaining nums2 elements (nums1 elements are already in place)
- **Pattern recognition**: When you need to merge in-place, consider working backwards

## Complexity
- **Time**: O(m + n) - visit each element once
- **Space**: O(1) - merge in-place using only a few pointer variables

## Variations & Follow-ups
- **Merge k sorted arrays**: Extend to multiple arrays using heap/priority queue
- **What if nums1 was smaller?**: Would need additional space or different approach
- **Merge linked lists**: Similar concept but with pointer manipulation
- **Count inversions**: Track how many swaps needed during merge

## Related Problems
- [Merge Two Sorted Lists (21)](https://leetcode.com/problems/merge-two-sorted-lists/)
- [Merge k Sorted Lists (23)](https://leetcode.com/problems/merge-k-sorted-lists/)
- [Sort Colors (75)](https://leetcode.com/problems/sort-colors/) - another in-place sorting
- [Intersection of Two Arrays (349/350)](https://leetcode.com/problems/intersection-of-two-arrays/)

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
