# Longest Consecutive Sequence

**Difficulty**: Medium
**Pattern**: hash-maps-and-sets
**Strategy**: hash set for O(1) lookups
**LeetCode**: 128
**Educative**: [Course/Problem Reference]

## Problem Statement
[LeetCode #128](https://leetcode.com/problems/longest-consecutive-sequence/)

Given an unsorted array of integers `nums`, return the length of the longest consecutive elements sequence.

You must write an algorithm that runs in O(n) time complexity.

Example 1:
Input: nums = [100,4,200,1,3,2]
Output: 4
Explanation: The longest consecutive elements sequence is [1, 2, 3, 4]. Therefore its length is 4.

Example 2:
Input: nums = [0,3,7,2,5,8,4,6,0,1]
Output: 9

Constraints:
- 0 <= nums.length <= 10^5
- -10^9 <= nums[i] <= 10^9

## Approach
1. **Convert to hash set** for O(1) lookup operations
2. **Iterate through unique numbers** and identify sequence starts
3. **Find sequence starts**: A number is a sequence start if `num - 1` is not in the set
4. **Expand sequence**: For each start, count consecutive numbers (num, num+1, num+2, ...)
5. **Track maximum length** encountered across all sequences
6. Return the maximum sequence length found

**Key optimization**: Only start counting from the beginning of each sequence to avoid redundant work.

## Key Insights
- **Hash set advantage**: Convert array to set for O(1) membership testing
- **Sequence start detection**: Only begin counting from the start of sequences (when `num-1` not in set)
- **Avoid redundancy**: Don't count sequences from the middle - this ensures O(n) time
- **Handle duplicates**: Set automatically handles duplicate values
- **Greedy expansion**: Once we find a sequence start, greedily expand as far as possible
- **Pattern recognition**: When you need to find consecutive elements, hash set provides efficient lookups

## Complexity
- **Time**: O(n) - Each number is visited at most twice (once in main loop, once during sequence expansion)
- **Space**: O(n) - Hash set stores all unique numbers

## Variations & Follow-ups
- **Longest consecutive sequence in binary tree**: Use in-order traversal + hash set
- **Consecutive sequence with exactly k elements**: Modify to find sequences of specific length
- **Consecutive sequence with gaps allowed**: Allow up to k missing numbers
- **Find all consecutive sequences**: Return all sequences, not just the longest
- **Consecutive sequence in 2D array**: Extend concept to matrix/grid problems

## Related Problems
- [Missing Number (268)](https://leetcode.com/problems/missing-number/)
- [First Missing Positive (41)](https://leetcode.com/problems/first-missing-positive/)
- [Find All Numbers Disappeared in an Array (448)](https://leetcode.com/problems/find-all-numbers-disappeared-in-an-array/)
- [Continuous Subarray Sum (523)](https://leetcode.com/problems/continuous-subarray-sum/)

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
