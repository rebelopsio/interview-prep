"""
Remove Linked List Elements - Easy
Pattern: linked-lists
LeetCode: 203
"""

# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next

class Solution:
    def removeElements(self, head: Optional[ListNode], val: int) -> Optional[ListNode]:
        current, previous = head, None
        while current:
            if current.val == val:
                if current == head:
                    head = current.next
                    current = current.next
                    continue
                if previous is not None:
                    previous.next = current.next
                    current = current.next
                    continue
            previous = current
            current = current.next
        return head





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
- Pattern: linked-lists
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
