"""
Intersection of Two Linked Lists - Easy
Pattern: fast-slow-pointers
LeetCode: 160
"""

def getIntersectionNode(self, headA: ListNode, headB: ListNode) -> Optional[ListNode]:
    ptr_a, ptr_b = headA, headB
    while ptr_a != ptr_b:
        ptr_a = ptr_a.next if ptr_a else headB
        ptr_b = ptr_b.next if ptr_b else headA
    return ptr_a

def main():
    getIntersectionNode()


if __name__ == "__main__":
    main()

# Test cases
def test_examples():
    """TODO: Add test cases"""
    assert True  # Placeholder test
    pass

"""
Problem Analysis:
- Pattern: fast-slow-pointers
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
