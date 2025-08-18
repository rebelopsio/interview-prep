# Two Pointers Pattern

## When to Use
- Array/string problems requiring comparison of elements
- Need to find pairs or triplets with specific relationships
- Looking for palindromes or symmetric properties
- Need to remove duplicates in sorted array
- Partitioning problems

## Key Insights
- Use when brute force would be O(n²) but can be optimized to O(n)
- Start pointers at different positions (beginning/end, or slow/fast)
- Move pointers based on comparison logic
- Often used with sorted arrays/strings

## Common Variations
- **Opposite Direction**: Start from both ends, move toward center
- **Same Direction**: Both pointers start from beginning (fast/slow)
- **Multiple Arrays**: Pointers in different arrays

## Implementation Notes
### Go Specific
```go
// Typical pattern
left, right := 0, len(arr)-1
for left < right {
    // Logic here
    if condition {
        left++
    } else {
        right--
    }
}
```

### Rust Specific
```rust
// Typical pattern
let mut left = 0;
let mut right = arr.len() - 1;
while left < right {
    // Logic here
    match condition {
        true => left += 1,
        false => right -= 1,
    }
}
```

## Time/Space Complexity
- **Time**: Usually O(n)
- **Space**: O(1) - only using two pointers

## Problems Solved
- [ ] Valid Palindrome (Easy)
- [ ] Two Sum II (Easy)
- [ ] 3Sum (Medium)
- [ ] Container With Most Water (Medium)
- [ ] Remove Duplicates from Sorted Array (Easy)

## Resources
- **Educative**: Grokking Coding Interview - Two Pointers
- **Book Reference**: Alex Xu Chapter [X]
- **neetcode.io**: Two Pointers playlist
