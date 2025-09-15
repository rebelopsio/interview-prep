package main

import "fmt"

// Happy Numuer - Easy
// Pattern: fast-slow-pointers
// LeetCode: 202

func isHappy(n int) bool {
	slow, fast := n, n
	for {
		slow = GetNextNum(slow)
		fast = GetNextNum(GetNextNum(fast))
		if fast == 1 {
			return true
		} else if fast == slow {
			return false
		}
	}
}

func GetNextNum(x int) int {
	nextNum := 0
	for x > 0 {
		d := x % 10
		x = x / 10
		nextNum = nextNum + (d * d)
	}
	return nextNum
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
