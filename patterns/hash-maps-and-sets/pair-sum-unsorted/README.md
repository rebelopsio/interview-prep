# Two Sum

**Difficulty**: Easy
**Pattern**: hash-maps-and-sets
**Strategy**: hash map for complement lookup
**LeetCode**: 1
**Educative**: [Course/Problem Reference]

## Problem Statement
[LeetCode #1](https://leetcode.com/problems/two-sum/)

Given an array of integers `nums` and an integer `target`, return indices of the two numbers such that they add up to `target`.

You may assume that each input would have exactly one solution, and you may not use the same element twice.

You can return the answer in any order.

Example 1:
Input: nums = [2,7,11,15], target = 9
Output: [0,1]
Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].

Example 2:
Input: nums = [3,2,4], target = 6
Output: [1,2]

Example 3:
Input: nums = [3,3], target = 6
Output: [0,1]

## Approach
1. **Use hash map** to store numbers and their indices as we iterate
2. **For each number**, calculate the complement needed: `complement = target - num`
3. **Check if complement exists** in hash map:
   - If yes: return current index and complement's stored index
   - If no: store current number and index in hash map
4. **Continue until pair found** (guaranteed by problem constraints)

**Why hash map works**: Provides O(1) average lookup time for checking if complement exists.

Alternative approaches:
- **Brute force**: Nested loops O(n²) - check all pairs
- **Sort + two pointers**: O(n log n) - but loses original indices

## Key Insights
- **Single pass solution**: Only need one iteration through the array
- **Complement strategy**: For each number, look for `target - number`
- **Hash map stores indices**: Need to return positions, not just values
- **Avoid same element twice**: Current element not yet in map when we check
- **Early termination**: Return immediately when pair found
- **Pattern recognition**: When you need to find pairs that sum to target, consider hash map for O(n) solution

## Complexity
- **Time**: O(n) - single pass through array with O(1) hash map operations
- **Space**: O(n) - hash map can store up to n-1 elements in worst case

## Variations & Follow-ups
- **Two Sum II - Input Array Is Sorted**: Use two pointers approach
- **3Sum**: Extend to three numbers, use sorting + two pointers
- **4Sum**: Further extension with nested loops
- **Two Sum - Count pairs**: Count number of valid pairs instead of returning indices
- **Two Sum - All pairs**: Find all pairs that sum to target (handle duplicates)
- **Two Sum - Closest sum**: Find pair with sum closest to target

## Related Problems
- [Two Sum II - Input Array Is Sorted (167)](https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/)
- [3Sum (15)](https://leetcode.com/problems/3sum/)
- [4Sum (18)](https://leetcode.com/problems/4sum/)
- [Two Sum IV - Input is a BST (653)](https://leetcode.com/problems/two-sum-iv-input-is-a-bst/)

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
