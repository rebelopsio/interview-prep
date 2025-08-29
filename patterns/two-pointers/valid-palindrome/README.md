# Valid Palindrome

**Difficulty**: Easy
**Pattern**: two-pointers
**Strategy**: inward traversal
**LeetCode**: 125
**Educative**: [Course/Problem Reference]

## Problem Statement
[LeetCode #125](https://leetcode.com/problems/valid-palindrome/)

A phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward. Alphanumeric characters include letters and numbers.

Given a string `s`, return `true` if it is a palindrome, or `false` otherwise.

Example 1:
Input: s = "A man, a plan, a canal: Panama"
Output: true
Explanation: "amanaplanacanalpanama" is a palindrome.

Example 2:
Input: s = "race a car"
Output: false
Explanation: "raceacar" is not a palindrome.

Example 3:
Input: s = " "
Output: true
Explanation: s is an empty string "" after removing non-alphanumeric characters.
Since an empty string reads the same forward and backward, it is a palindrome.

## Approach
1. Use **inward traversal** with two pointers: left starts at 0, right starts at end
2. Skip non-alphanumeric characters by advancing pointers
3. Convert characters to lowercase for comparison
4. If characters don't match, return false
5. Continue until pointers meet in the middle
6. If we complete the loop, return true

Alternative: Preprocess string to remove non-alphanumeric and convert to lowercase, then use simple two-pointer check.

## Key Insights
- **Character filtering**: Only compare alphanumeric characters
- **Case insensitive**: Convert to same case for comparison
- **Skip invalid characters**: Move pointers past non-alphanumeric chars
- **Early termination**: Return false immediately on mismatch
- **Built-in methods**: Use `isalnum()` and `lower()` for cleaner code
- **Edge cases**: Empty string after filtering is considered palindrome

## Complexity
- **Time**: O(n) - single pass through the string
- **Space**: O(1) - only using two pointers, no extra space for string manipulation

## Variations & Follow-ups
- **Valid Palindrome II**: Can delete at most one character
- **Case-sensitive palindromes**: Don't ignore case
- **Palindrome with specific rules**: Different character filtering
- **Longest palindromic substring**: Find the longest palindrome within string
- **Check if permutation can form palindrome**: Count character frequencies

## Related Problems
- [Valid Palindrome II (680)](https://leetcode.com/problems/valid-palindrome-ii/)
- [Longest Palindromic Substring (5)](https://leetcode.com/problems/longest-palindromic-substring/)
- [Palindrome Linked List (234)](https://leetcode.com/problems/palindrome-linked-list/)
- [Reverse String (344)](https://leetcode.com/problems/reverse-string/)

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
