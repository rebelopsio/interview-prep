package main

import "fmt"

// Pair Sum - Unsorted - Medium
// Pattern: hash-maps-and-sets

func twoSum(nums []int, target int) []int {
	store := map[int]int{}
	ans := []int{}
	for i, v := range nums {
		pair := target - v
		idx, ok := store[pair]
		if ok {
			ans = append(ans, idx, i)
		} else {
			store[v] = i
		}
	}
	return ans
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
- Pattern: hash-maps-and-sets
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
