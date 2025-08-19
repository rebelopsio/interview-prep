"""
Valid Palindrome - Easy
Pattern: two-pointers
LeetCode: 125
"""

def solve(s: str) -> bool:
    s = s.lower()
    p1, p2 = 0, len(s) - 1
    while p1 < p2:
        if not s[p1].isalnum():
            p1 += 1
            continue
        if not s[p2].isalnum():
            p2 -= 1
            continue
        if s[p1] == s[p2]:
            p1 += 1
            p2 -= 1
        else:
            return False
    return True

def main():
    print(solve("No lemon, no melon"))

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
1. Convert string to lowercase 
2. Use inward traversal strategy with two pointers
3. Use guard clauses when wet with non alpha numeric characters

Edge Cases:
- Based on my approach, I had to consider the case of non alpha numeric characters since I didn't use regex or list 
comprehension to remove them. For this implemented a guard clause at the top of the loop such that if the current pointer
index contained a non alphanumeric character, increment/decrement the pointer value and continue with another iteration 
of the loop.
"""
