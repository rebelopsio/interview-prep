# Verify Sudoku Board

**Difficulty**: Medium
**Pattern**: hash-maps-and-sets
**LeetCode**: [Problem 36](https://leetcode.com/problems/valid-sudoku/)
**neetcode.io**: [Video Explanation](https://youtu.be/TjFXEUCMqI8)
**Educative**: [Course/Problem Reference]

## Problem Statement
Determine if a `9 x 9` Sudoku board is valid. Only the filled cells need to be validated according to the following rules:

1. Each row must contain the digits `1-9` without repetition.
2. Each column must contain the digits `1-9` without repetition.
3. Each of the nine `3 x 3` sub-boxes of the grid must contain the digits `1-9` without repetition.

Note:

- A Sudoku board (partially filled) could be valid but is not necessarily solvable.
- Only the filled cells need to be validated according to the mentioned rules.


## Approach
- Use hash sets to track seen numbers in rows, columns, and boxes.
- Iterate through each cell in the board.
- For each filled cell, check if the number has already been seen in the corresponding row, column, or box.
- If a duplicate is found, return false.
- If no duplicates are found after checking all cells, return true.

## Key Insights
- Learned:
  - How to efficiently track duplicates using hash sets.
  - How to map 2D grid positions to 3x3 sub-box indices.
- Gotchas:
  - Remember to skip empty cells ('.').
  - Correctly calculate the index for the 3x3 sub-box using `(row // 3) * 3 + (col // 3)`.
- Patterns to recognize:
  - Using hash sets for O(1) lookups.
  - Mapping 2D grid positions to 3x3 sub-box indices.

## Complexity
- **Time**: O(?)
- **Space**: O(?)

## Variations & Follow-ups
- Variations:
  - Validate a larger Sudoku board (e.g., 16x16).
  - Check for solvability of the Sudoku board.
- Follow-ups questions for interviewers:
  - How would you modify the solution to handle different board sizes?
  - Can you optimize the space complexity further?
## Related Problems
- [Sudoku Solver](https://leetcode.com/problems/sudoku-solver/)
- [N-Queens](https://leetcode.com/problems/n-queens/)
- [Word Search](https://leetcode.com/problems/word-search/)

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
