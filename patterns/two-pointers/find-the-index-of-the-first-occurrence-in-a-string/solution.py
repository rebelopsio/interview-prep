"""
Find the Index of the First Occurrence in a String - Easy
Pattern: two-pointers
LeetCode: 28
"""

def strStr(haystack: str, needle: str) -> int:
    p1, p2 = 0, 0
    while p2 < len(haystack):
        if haystack[p1] == needle[0]:
            for i in range(len(needle)):
                if p2 < len(haystack) and haystack[p2] == needle[i]:
                    p2 += 1
                    if p2 - p1 == len(needle):
                        return p1
                else:
                    break
        p1 += 1
        p2 = p1
    return -1

def main():
    print(strStr("sadbutsad", "sad"))
    print(strStr("leetcode", "leeto"))

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
