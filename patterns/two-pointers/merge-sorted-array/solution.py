"""
Merge Sorted Array - Easy
Pattern: two-pointers
LeetCode: 88
"""
from typing import List

def solve(nums1: List[int], m: int, nums2: List[int], n: int) -> None:
    last = (m + n) - 1
    while m > 0 and n > 0:
        if nums1[m - 1] > nums2[n - 1]:
            nums1[last] = nums1[m - 1]
            m -= 1
        else:
          nums1[last] = nums2[n - 1]
          n -= 1
        last -= 1
    while n > 0:
        nums1[last] = nums2[n - 1]
        last, n = last - 1, n - 1

def main():
    nums1, m, nums2, n = [4,5,6,0,0,0], 3, [1,2,3], 3
    solve(nums1, m, nums2, n)
    print(nums1)
    nums1, m, nums2, n = [1,2,3,0,0,0], 3, [2,5,6], 3
    solve(nums1, m, nums2, n)
    print(nums1)

if __name__ == "__main__":
    main()

# Test cases
def test_examples():
    """TODO: Add test cases"""
    assert True  # Placeholder test
    pass

"""
Problem Analysis:
- Pattern: two-pointers
- Time Complexity: O(?)
- Space Complexity: O(?)

Approach:
1. [Step 1]
2. [Step 2]
3. [Step 3]

Edge Cases:
- [Edge case 1]
- [Edge case 2]
"""
