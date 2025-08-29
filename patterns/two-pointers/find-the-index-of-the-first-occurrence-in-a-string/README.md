# Find the Index of the First Occurrence in a String

**Difficulty**: Easy
**Pattern**: two-pointers
**Strategy**: sliding window / string matching
**LeetCode**: 28
**Educative**: [Course/Problem Reference]

## Problem Statement
[Leetcode - #28](https://leetcode.com/problems/find-the-index-of-the-first-occurrence-in-a-string)

Given two strings `needle` and `haystack`, return the index of the first occurrence of `needle` in `haystack`, or `-1` if `needle` is not part of `haystack`.

Example 1:

Input: haystack = "sadbutsad", needle = "sad"
Output: 0
Explanation: "sad" occurs at index 0 and 6.
The first occurrence is at index 0, so we return 0.

Example 2:

Input: haystack = "leetcode", needle = "leeto"
Output: -1
Explanation: "leeto" did not occur in "leetcode", so we return -1.

Constraints:

1 <= haystack.length, needle.length <= 104
haystack and needle consist of only lowercase English characters.

## Approach
1. Use **sliding window** approach with two pointers
2. Iterate through haystack with outer pointer (i)
3. For each position, use inner pointer (j) to check if needle matches starting at position i
4. If full match found, return starting index i
5. If no match found after checking all positions, return -1
6. Alternative: Use built-in string methods like `find()` or `index()`

## Key Insights
- Can be solved with simple iteration and string comparison
- Two-pointer technique helps track position in both strings
- Built-in string methods often implement optimized algorithms (like KMP)
- Early termination when remaining haystack is shorter than needle
- Consider edge cases: empty needle, needle longer than haystack

## Complexity
- **Time**: O(n*m) where n = len(haystack), m = len(needle) - worst case with naive approach
- **Space**: O(1) - only using constant extra space

## Variations & Follow-ups
- Implement KMP algorithm for O(n+m) time complexity
- Find all occurrences instead of just the first
- Case-insensitive matching
- Pattern matching with wildcards
- Implement strstr() function in C

## Related Problems
- LeetCode 686: Repeated String Match
- LeetCode 459: Repeated Substring Pattern
- LeetCode 214: Shortest Palindrome
- String matching algorithms (KMP, Boyer-Moore, Rabin-Karp)

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
