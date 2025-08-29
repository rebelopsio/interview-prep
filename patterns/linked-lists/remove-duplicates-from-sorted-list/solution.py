"""
Remove Duplicates from Sorted List - Easy
Pattern: linked-lists
LeetCode: 83
"""
from typing import Optional

# Definition for singly-linked list.
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

class Solution:
    def delete_duplicates(self, head: Optional[ListNode]) -> Optional[ListNode]:
        if head is None or head.next is None:
            return head
        previous, current = None, head
        while current is not None:
            if previous is not None:
                if previous.val == current.val:
                    previous.next = current.next
                    current = current.next
                    continue
            previous = current
            current = current.next
        return head


# Helper functions for testing
def create_linked_list(values):
    """Create a linked list from a list of values"""
    if not values:
        return None

    head = ListNode(values[0])
    current = head
    for val in values[1:]:
        current.next = ListNode(val)
        current = current.next
    return head

def linked_list_to_list(head):
    """Convert linked list to Python list for easy comparison"""
    result = []
    current = head
    while current:
        result.append(current.val)
        current = current.next
    return result

# Test cases
def test_examples():
    """Test cases for Remove Duplicates from Sorted List"""

    # Test Case 1: Example from LeetCode - [1,1,2] -> [1,2]
    head1 = create_linked_list([1, 1, 2])
    result1 = Solution().delete_duplicates(head1)
    expected1 = [1, 2]
    assert linked_list_to_list(result1) == expected1, f"Expected {expected1}, got {linked_list_to_list(result1)}"

    # Test Case 2: Example from LeetCode - [1,1,2,3,3] -> [1,2,3]
    head2 = create_linked_list([1, 1, 2, 3, 3])
    result2 = Solution().delete_duplicates(head2)
    expected2 = [1, 2, 3]
    assert linked_list_to_list(result2) == expected2, f"Expected {expected2}, got {linked_list_to_list(result2)}"

    # Test Case 3: Empty list
    head3 = create_linked_list([])
    result3 = Solution().delete_duplicates(head3)
    expected3 = []
    assert linked_list_to_list(result3) == expected3, f"Expected {expected3}, got {linked_list_to_list(result3)}"

    # Test Case 4: Single node
    head4 = create_linked_list([1])
    result4 = Solution().delete_duplicates(head4)
    expected4 = [1]
    assert linked_list_to_list(result4) == expected4, f"Expected {expected4}, got {linked_list_to_list(result4)}"

    # Test Case 5: No duplicates
    head5 = create_linked_list([1, 2, 3, 4, 5])
    result5 = Solution().delete_duplicates(head5)
    expected5 = [1, 2, 3, 4, 5]
    assert linked_list_to_list(result5) == expected5, f"Expected {expected5}, got {linked_list_to_list(result5)}"

    # Test Case 6: All same values
    head6 = create_linked_list([2, 2, 2, 2, 2])
    result6 = Solution().delete_duplicates(head6)
    expected6 = [2]
    assert linked_list_to_list(result6) == expected6, f"Expected {expected6}, got {linked_list_to_list(result6)}"

    # Test Case 7: Duplicates at the beginning
    head7 = create_linked_list([1, 1, 1, 2, 3])
    result7 = Solution().delete_duplicates(head7)
    expected7 = [1, 2, 3]
    assert linked_list_to_list(result7) == expected7, f"Expected {expected7}, got {linked_list_to_list(result7)}"

    # Test Case 8: Duplicates at the end
    head8 = create_linked_list([1, 2, 3, 3, 3])
    result8 = Solution().delete_duplicates(head8)
    expected8 = [1, 2, 3]
    assert linked_list_to_list(result8) == expected8, f"Expected {expected8}, got {linked_list_to_list(result8)}"

    # Test Case 9: Two nodes with same value
    head9 = create_linked_list([1, 1])
    result9 = Solution().delete_duplicates(head9)
    expected9 = [1]
    assert linked_list_to_list(result9) == expected9, f"Expected {expected9}, got {linked_list_to_list(result9)}"

    # Test Case 10: Multiple groups of duplicates
    head10 = create_linked_list([1, 1, 2, 2, 3, 4, 4, 5, 5, 5])
    result10 = Solution().delete_duplicates(head10)
    expected10 = [1, 2, 3, 4, 5]
    assert linked_list_to_list(result10) == expected10, f"Expected {expected10}, got {linked_list_to_list(result10)}"

    # Test Case 11: Negative numbers with duplicates
    head11 = create_linked_list([-3, -3, -1, 0, 0, 1, 1])
    result11 = Solution().delete_duplicates(head11)
    expected11 = [-3, -1, 0, 1]
    assert linked_list_to_list(result11) == expected11, f"Expected {expected11}, got {linked_list_to_list(result11)}"

    # Test Case 12: Edge values from constraints (-100 to 100)
    head12 = create_linked_list([-100, -100, 100, 100])
    result12 = Solution().delete_duplicates(head12)
    expected12 = [-100, 100]
    assert linked_list_to_list(result12) == expected12, f"Expected {expected12}, got {linked_list_to_list(result12)}"

    print("All test cases passed!")

def main():
    # Run tests when main is called
    test_examples()

if __name__ == "__main__":
    main()

"""
Problem Analysis:
- Pattern: linked-lists
- Time Complexity: O(n) - single pass through the list
- Space Complexity: O(1) - only using constant extra space

Approach:
1. Traverse the linked list with a current pointer
2. For each node, check if current.val == current.next.val
3. If duplicate found, skip the next node by updating current.next
4. If no duplicate, move to the next node
5. Return the head of the modified list

Edge Cases:
- Empty list (head is None)
- Single node list
- All nodes have the same value
- No duplicates present
- Duplicates at beginning, middle, or end
- Multiple groups of consecutive duplicates
- Negative values within constraints (-100 to 100)
"""
