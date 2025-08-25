from typing import List
"""
Verify Sudoku Board - Medium
Pattern: hash-maps-and-sets
Leetcode: 36
"""

"""
Example input:
    [["5","3",".",".","7",".",".",".","."]
    ,["6",".",".","1","9","5",".",".","."]
    ,[".","9","8",".",".",".",".","6","."]
    ,["8",".",".",".","6",".",".",".","3"]
    ,["4",".",".","8",".","3",".",".","1"]
    ,["7",".",".",".","2",".",".",".","6"]
    ,[".","6",".",".",".",".","2","8","."]
    ,[".",".",".","4","1","9",".",".","5"]
    ,[".",".",".",".","8",".",".","7","9"]]
"""
def solve(board: List[List[str]]) -> bool:
    rows = [set() for _ in range(9)]
    columns = [set() for _ in range(9)]
    sub_matrix = [[set() for _ in range(3)] for _ in range(3)]

    for r in range(9):
        for c in range(9):
            num = board[r][c]
            if num == ".":
                continue
            if num in rows[r]:
                return False
            if c in columns[c]:
                return False
            if num in sub_matrix[r // 3][c // 3]:
                return False
            rows[r].add(num)
            columns[c].add(num)
            sub_matrix[r // 3][c // 3].add(num)
    return True

def main():
    board = [["5","3",".",".","7",".",".",".","."]
    ,["6",".",".","1","9","5",".",".","."]
    ,[".","9","8",".",".",".",".","6","."]
    ,["8",".",".",".","6",".",".",".","3"]
    ,["4",".",".","8",".","3",".",".","1"]
    ,["7",".",".",".","2",".",".",".","6"]
    ,[".","6",".",".",".",".","2","8","."]
    ,[".",".",".","4","1","9",".",".","5"]
    ,[".",".",".",".","8",".",".","7","9"]]
    print(solve(board))

    board = [["8","3",".",".","7",".",".",".","."]
    ,["6",".",".","1","9","5",".",".","."]
    ,[".","9","8",".",".",".",".","6","."]
    ,["8",".",".",".","6",".",".",".","3"]
    ,["4",".",".","8",".","3",".",".","1"]
    ,["7",".",".",".","2",".",".",".","6"]
    ,[".","6",".",".",".",".","2","8","."]
    ,[".",".",".","4","1","9",".",".","5"]
    ,[".",".",".",".","8",".",".","7","9"]]
    print(solve(board))

if __name__ == "__main__":
    main()

# Test cases
def test_examples():
    """TODO: Add test cases"""
    assert True  # Placeholder test
    pass

"""
Problem Analysis:
- Pattern: hash-maps-and-sets
- Time Complexity: O(n^2)
- Space Complexity: O(n^2)

Approach:
1. [Step 1]
2. [Step 2]
3. [Step 3]

Edge Cases:
- [Edge case 1]
- [Edge case 2]
"""
