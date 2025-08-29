# Set Matrix Zeroes

**Difficulty**: Medium
**Pattern**: hash-maps-and-sets
**Strategy**: hash sets to track zero positions
**LeetCode**: 73
**Educative**: [Course/Problem Reference]

## Problem Statement
[LeetCode #73](https://leetcode.com/problems/set-matrix-zeroes/)

Given an `m x n` integer matrix `matrix`, if an element is 0, set its entire row and column to 0's.

You must do it in place.

Example 1:
Input: matrix = [[1,1,1],[1,0,1],[1,1,1]]
Output: [[1,0,1],[0,0,0],[1,0,1]]

Example 2:
Input: matrix = [[0,1,2,0],[3,4,5,2],[1,3,1,5]]
Output: [[0,0,0,0],[0,4,5,0],[0,3,1,0]]

Follow up:
- A straightforward solution using O(mn) space is probably a bad idea.
- A simple improvement uses O(m + n) space, but still not the best solution.
- Could you devise a constant extra space solution?

## Approach
**Method 1: Hash Sets (O(m + n) space)**
1. **First pass**: Iterate through matrix and use hash sets to store row and column indices that contain zeros
2. **Second pass**: For each cell, if its row or column index is in the respective hash set, set it to zero

**Method 2: In-place markers (O(1) space)**
1. **Use first row and column as markers**: Store zero indicators in matrix[0][j] and matrix[i][0]
2. **Handle edge case**: Use separate variables for first row and first column since they overlap at matrix[0][0]
3. **Three passes**:
   - Pass 1: Scan matrix, mark first row/column if zeros found
   - Pass 2: Use markers to set zeros (skip first row/column)
   - Pass 3: Handle first row and column separately

## Key Insights
- **Two-phase approach**: Must identify all zeros first, then set them (can't set during identification)
- **Hash set solution**: Simple and clear, uses O(m + n) extra space for tracking
- **In-place optimization**: Use matrix itself as storage for markers to achieve O(1) space
- **Edge case handling**: First row and column need special treatment in O(1) solution
- **Pattern recognition**: When you need to track which rows/columns to modify, hash sets provide clean bookkeeping
- **Space-time tradeoff**: O(1) solution is more complex but achieves optimal space usage

## Complexity
**Method 1 (Hash Sets):**
- **Time**: O(m × n) - two passes through the matrix
- **Space**: O(m + n) - hash sets to store row and column indices

**Method 2 (In-place):**
- **Time**: O(m × n) - three passes through the matrix
- **Space**: O(1) - only using a few extra variables

## Variations & Follow-ups
- **Set Matrix Ones**: If element is 1, set entire row and column to 1's
- **Multiple values**: Handle multiple trigger values, not just zero
- **3D matrix**: Extend to three dimensions (set entire planes)
- **Sparse matrices**: Optimize for matrices with few zeros
- **Stream processing**: Handle matrix updates one cell at a time
- **Interview follow-ups**:
  - How would you handle very large matrices that don't fit in memory?
  - What if you could only read the matrix once?
  - How would you parallelize this operation?

## Related Problems
- [Game of Life (289)](https://leetcode.com/problems/game-of-life/)
- [Spiral Matrix (54)](https://leetcode.com/problems/spiral-matrix/)
- [Rotate Image (48)](https://leetcode.com/problems/rotate-image/)
- [Valid Sudoku (36)](https://leetcode.com/problems/valid-sudoku/)

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
