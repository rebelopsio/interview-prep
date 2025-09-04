package main

import "fmt"

// Intersection of Two Linked Lists - Easy
// Pattern: fast-slow-pointers
// LeetCode: 160

/**
 * Definition for singly-linked list.
 * type ListNode struct {
 *     Val int
 *     Next *ListNode
 * }
 */
func getIntersectionNode(headA, headB *ListNode) *ListNode {
	ptr_a, ptr_b := headA, headB
	for ptr_a != ptr_b {
		if ptr_a != nil {
			ptr_a = ptr_a.Next
		} else {
			ptr_a = headB
		}
		if ptr_b != nil {
			ptr_b = ptr_b.Next
		} else {
			ptr_b = headA
		}
	}
	return ptr_a
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
