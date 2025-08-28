# Bitwise XOR Pattern

## When to Use
- Problems involving finding unique elements or missing numbers
- Need to detect pairs or find the single non-paired element
- Swapping variables without extra space
- Problems where you need to toggle bits or find differences
- Cryptography and encoding problems

## Key Insights
- XOR of two identical numbers is 0: `a ^ a = 0`
- XOR of any number with 0 is the number itself: `a ^ 0 = a`
- XOR is commutative and associative: `a ^ b = b ^ a`, `(a ^ b) ^ c = a ^ (b ^ c)`
- XORing a number twice returns original: `a ^ b ^ b = a`
- Use XOR to find missing or unique elements efficiently

## Common Variations
- **Single Number**: Find the element that appears only once
- **Missing Number**: Find missing number in sequence using XOR
- **Two Missing Numbers**: Find two missing numbers in array
- **Bit Manipulation**: Toggle, set, or clear specific bits
- **Complement Problems**: Find complement of numbers

## Implementation Notes
### Python Specific
```python
# Find single number in array where others appear twice
def single_number(nums):
    result = 0
    for num in nums:
        result ^= num
    return result

# Check if bit is set
def is_bit_set(num, i):
    return (num & (1 << i)) != 0

# Toggle bit at position i
def toggle_bit(num, i):
    return num ^ (1 << i)
```

### Go Specific
```go
// Find single number
func singleNumber(nums []int) int {
    result := 0
    for _, num := range nums {
        result ^= num
    }
    return result
}

// Count set bits
func countSetBits(n int) int {
    count := 0
    for n > 0 {
        count += n & 1
        n >>= 1
    }
    return count
}
```

### Rust Specific
```rust
// Find single number
fn single_number(nums: Vec<i32>) -> i32 {
    nums.iter().fold(0, |acc, &x| acc ^ x)
}

// Check if power of 2
fn is_power_of_two(n: i32) -> bool {
    n > 0 && (n & (n - 1)) == 0
}

// Get rightmost set bit
fn rightmost_set_bit(n: i32) -> i32 {
    n & -n
}
```

## Time/Space Complexity
- **Time**: Usually O(n) for single pass through data
- **Space**: O(1) - constant space for XOR operations

## Problems Solved
- [ ] Problem 1 (Easy) - [Link to folder]
- [ ] Problem 2 (Medium) - [Link to folder]
- [ ] Problem 3 (Hard) - [Link to folder]

## Resources
- **Educative**: Grokking Coding Interview - Bitwise XOR
- **Book Reference**: Bit manipulation fundamentals
- **neetcode.io**: Bit Manipulation playlist
