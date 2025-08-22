"""
Pair Sum - Unsorted - Medium
Pattern: hash-maps-and-sets
LeetCode: 1
"""
from typing import List

def solve(self, nums: List[int], target: int) -> List[int]:
    ans = {}
    for i in range(len(nums)):
        pair = target - nums[i]
        if ans.get(pair) is None:
            return [ans[pair], i]
        if ans.get(nums[i]) is not None:
            ans[nums[i]] = i
    return []

def main():
    solve()

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
- Time Complexity: O(n)
- Space Complexity: O(n)

Approach:
1. [Step 1]
2. [Step 2]
3. [Step 3]

Edge Cases:
- [Edge case 1]
- [Edge case 2]
"""
