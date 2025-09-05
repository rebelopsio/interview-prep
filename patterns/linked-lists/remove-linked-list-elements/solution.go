package main

import (
	"fmt"
)

// Remove Linked List Elements - Easy
// Pattern: linked-lists
// LeetCode: 203

// Definition for singly-linked list.
type ListNode struct {
	Val  int
	Next *ListNode
}

func removeElements(head *ListNode, val int) *ListNode {
	if head == nil {
		return head
	}
	current, previous := head, new(ListNode)
	for current != nil {
		if current.Val == val {
			if current == head {
				head = current.Next
				current = head
				continue
			} else {
				previous.Next = current.Next
				current = current.Next
				continue
			}
		}
		previous = current
		current = current.Next
	}
	return head
}

func main() {
	solve()
}

// Test cases
func runTests() {
	// TODO: Add test cases
	fmt.Println("Tests not implemented yet")
}

/*
Problem Analysis:
- Pattern: linked-lists
- Time Complexity: O(n)
- Space Complexity: O(1)

Approach:
1. [Step 1]
2. [Step 2]
3. [Step 3]

Edge Cases:
- [Edge case 1]
- [Edge case 2]
*/
