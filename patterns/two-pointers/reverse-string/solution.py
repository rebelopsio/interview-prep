"""
Reverse String - Easy
Pattern: two-pointers
LeetCode: 344
"""
from typing import List


def reverse_string(s: List[str]):
    if len(s) > 1:
        left, right = 0, len(s) - 1
        while left < right:
            s[left], s[right] = s[right], s[left]
            left += 1
            right -= 1

def main():
    a1 = ["H","a","n","n","a","h"]
    reverse_string(a1)
    print(a1)
    a2 = ["h","e","l","l","o"]
    reverse_string(a2)
    print(a2)

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
- Time Complexity: O(n)
- Space Complexity: O(1)

Approach:
1. Define left (start of array) and right (end of array) pointers
2. while loop, until left is no longer less than right
3. Swap values
4. Increment left and decrement right until left is no longer smaller than right

Edge Cases:
- Array length can be equal to 1, only proceed if len is greater than 1. 
"""
