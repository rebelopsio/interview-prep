package main

import "fmt"

// Linked List Cycle - Easy
// Pattern: fast-slow-pointers
// LeetCode: 141

/**
 * Definition for singly-linked list.
 * type ListNode struct {
 *     Val int
 *     Next *ListNode
 * }
 */

func hasCycle(head *ListNode) bool {
	slow, fast := head, head
	for fast != nil && fast.Next != nil {
		slow = slow.Next
		fast = fast.Next.Next
		if slow == fast {
			return true
		}
	}
	return false
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
*/
