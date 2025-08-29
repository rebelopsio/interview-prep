# Verify Sudoku Board

**Difficulty**: Medium
**Pattern**: hash-maps-and-sets
**Strategy**: hash sets for duplicate detection
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
1. **Initialize tracking structures**: Use hash sets for each row, column, and 3x3 box
2. **Single pass through board**: Iterate through each cell (9x9 = 81 cells)
3. **Skip empty cells**: Only validate filled cells (ignore '.' characters)
4. **Three-way validation**: For each number, check if it already exists in:
   - Current row's hash set
   - Current column's hash set
   - Current 3x3 box's hash set
5. **Box index calculation**: Map (row, col) to box index using `(row // 3) * 3 + (col // 3)`
6. **Early termination**: Return `false` immediately if any duplicate found
7. **Success case**: Return `true` if all cells pass validation

## Key Insights
- **Hash set efficiency**: O(1) lookups for duplicate detection across rows, columns, and boxes
- **Box index mapping**: Critical insight - `(row // 3) * 3 + (col // 3)` maps any cell to its box (0-8)
- **Three-dimensional validation**: Must check constraints simultaneously, not sequentially
- **Empty cell handling**: Skip validation for '.' characters - only validate digits 1-9
- **Early exit optimization**: Return false as soon as any duplicate found
- **Pattern recognition**: When validating grid constraints with no duplicates allowed, hash sets are optimal
- **Space-time tradeoff**: Use O(1) extra space per constraint (27 sets total) for O(1) validation time

## Complexity
- **Time**: O(1) - Fixed 9x9 board size means constant 81 cell iterations with O(1) set operations
- **Space**: O(1) - Fixed storage: 9 row sets + 9 column sets + 9 box sets, each holding at most 9 digits

## Variations & Follow-ups
- **Different board sizes**: Extend to NxN boards with √N x √N boxes
- **Sudoku solver**: Use backtracking with this validation as constraint checker
- **Multiple solutions**: Modify to count all valid completions
- **Partial validation**: Check only specific regions instead of entire board
- **Stream processing**: Validate cells as they're added one by one
- **Interview follow-ups**:
  - How would you handle variable box sizes (not just 3x3)?
  - Can you validate without storing all seen numbers?
  - What if the board was much larger and couldn't fit in memory?
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
