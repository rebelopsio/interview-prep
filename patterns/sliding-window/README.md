# Sliding Window Pattern

## When to Use
- Problems involving contiguous subarrays or substrings
- Need to find maximum, minimum, or specific conditions in a window
- Looking for patterns in sequences with fixed or variable window sizes
- Optimization problems on arrays/strings where brute force would be O(n²) or O(n³)
- Problems involving "all subarrays of size k" or "longest/shortest subarray with condition"

## Key Insights
- Maintain a window that slides over the data structure
- Avoid recalculating from scratch for each window position
- Use two pointers (start and end) to define window boundaries
- Expand window by moving right pointer, contract by moving left pointer
- Keep track of window state (sum, count, frequency map, etc.)

## Common Variations
- **Fixed Size Window**: Window size remains constant (e.g., max sum of k elements)
- **Variable Size Window**: Window size changes based on conditions
- **Multiple Windows**: Track multiple windows simultaneously
- **String Pattern Matching**: Find all anagrams or permutations
- **Frequency Based**: Problems involving character or element counts

## Implementation Notes
### Python Specific
```python
# Fixed size sliding window
def max_sum_subarray(arr, k):
    if len(arr) < k:
        return -1

    # Calculate sum of first window
    window_sum = sum(arr[:k])
    max_sum = window_sum

    # Slide the window
    for i in range(len(arr) - k):
        window_sum = window_sum - arr[i] + arr[i + k]
        max_sum = max(max_sum, window_sum)

    return max_sum

# Variable size sliding window
def longest_substring_k_distinct(s, k):
    if len(s) == 0 or k == 0:
        return 0

    window_start = 0
    max_length = 0
    char_frequency = {}

    for window_end in range(len(s)):
        right_char = s[window_end]
        char_frequency[right_char] = char_frequency.get(right_char, 0) + 1

        # Shrink window if more than k distinct characters
        while len(char_frequency) > k:
            left_char = s[window_start]
            char_frequency[left_char] -= 1
            if char_frequency[left_char] == 0:
                del char_frequency[left_char]
            window_start += 1

        max_length = max(max_length, window_end - window_start + 1)

    return max_length
```

### Go Specific
```go
// Fixed size sliding window
func maxSumSubarray(arr []int, k int) int {
    if len(arr) < k {
        return -1
    }

    // Calculate sum of first window
    windowSum := 0
    for i := 0; i < k; i++ {
        windowSum += arr[i]
    }

    maxSum := windowSum

    // Slide the window
    for i := k; i < len(arr); i++ {
        windowSum = windowSum - arr[i-k] + arr[i]
        if windowSum > maxSum {
            maxSum = windowSum
        }
    }

    return maxSum
}

// Variable size sliding window
func longestSubstringKDistinct(s string, k int) int {
    if len(s) == 0 || k == 0 {
        return 0
    }

    windowStart := 0
    maxLength := 0
    charFrequency := make(map[byte]int)

    for windowEnd := 0; windowEnd < len(s); windowEnd++ {
        rightChar := s[windowEnd]
        charFrequency[rightChar]++

        // Shrink window if more than k distinct characters
        for len(charFrequency) > k {
            leftChar := s[windowStart]
            charFrequency[leftChar]--
            if charFrequency[leftChar] == 0 {
                delete(charFrequency, leftChar)
            }
            windowStart++
        }

        if windowEnd-windowStart+1 > maxLength {
            maxLength = windowEnd - windowStart + 1
        }
    }

    return maxLength
}
```

### Rust Specific
```rust
use std::collections::HashMap;

// Fixed size sliding window
fn max_sum_subarray(arr: &[i32], k: usize) -> Option<i32> {
    if arr.len() < k {
        return None;
    }

    // Calculate sum of first window
    let mut window_sum: i32 = arr[0..k].iter().sum();
    let mut max_sum = window_sum;

    // Slide the window
    for i in k..arr.len() {
        window_sum = window_sum - arr[i - k] + arr[i];
        max_sum = max_sum.max(window_sum);
    }

    Some(max_sum)
}

// Variable size sliding window
fn longest_substring_k_distinct(s: &str, k: usize) -> usize {
    if s.is_empty() || k == 0 {
        return 0;
    }

    let chars: Vec<char> = s.chars().collect();
    let mut window_start = 0;
    let mut max_length = 0;
    let mut char_frequency = HashMap::new();

    for window_end in 0..chars.len() {
        let right_char = chars[window_end];
        *char_frequency.entry(right_char).or_insert(0) += 1;

        // Shrink window if more than k distinct characters
        while char_frequency.len() > k {
            let left_char = chars[window_start];
            let count = char_frequency.get_mut(&left_char).unwrap();
            *count -= 1;
            if *count == 0 {
                char_frequency.remove(&left_char);
            }
            window_start += 1;
        }

        max_length = max_length.max(window_end - window_start + 1);
    }

    max_length
}
```

## Time/Space Complexity
- **Time**: Usually O(n) where n is the size of input (single pass with sliding window)
- **Space**: O(1) for simple windows, O(k) for frequency maps where k is distinct elements

## Problems Solved
- [ ] Problem 1 (Easy) - [Link to folder]
- [ ] Problem 2 (Medium) - [Link to folder]
- [ ] Problem 3 (Hard) - [Link to folder]

## Resources
- **Educative**: Grokking Coding Interview - Sliding Window
- **Book Reference**: Array and String processing
- **neetcode.io**: Sliding Window playlist
