# Cyclic Sort Pattern

## When to Use
- Array contains numbers in a given range (usually 1 to n or 0 to n-1)
- Need to find missing, duplicate, or misplaced numbers
- Array elements can be used as indices to place elements in correct positions
- Problems involving permutations or arrangements of consecutive numbers
- Need to sort array containing numbers in specific range in O(n) time

## Key Insights
- Use the fact that numbers are in range [1, n] to place each number at index (number - 1)
- If number is already in correct position, move to next
- If number is out of range or already placed correctly elsewhere, skip
- After one pass, numbers will be in correct positions or missing/duplicate will be identified
- Works because we can use array values as indices

## Common Variations
- **Find Missing Number**: Identify which number is missing from 1 to n
- **Find Duplicate**: Identify duplicate number in array
- **Find All Missing Numbers**: Find all missing numbers in range
- **Find All Duplicates**: Find all duplicate numbers
- **First Missing Positive**: Find smallest missing positive integer

## Implementation Notes
### Python Specific
```python
# Basic cyclic sort template
def cyclic_sort(nums):
    i = 0
    while i < len(nums):
        correct_index = nums[i] - 1
        if nums[i] != nums[correct_index]:
            nums[i], nums[correct_index] = nums[correct_index], nums[i]
        else:
            i += 1
    return nums

# Find missing number
def find_missing_number(nums):
    i = 0
    n = len(nums)

    # Place numbers in correct positions
    while i < n:
        correct_index = nums[i]
        if nums[i] < n and nums[i] != nums[correct_index]:
            nums[i], nums[correct_index] = nums[correct_index], nums[i]
        else:
            i += 1

    # Find missing number
    for i in range(n):
        if nums[i] != i:
            return i

    return n
```

### Go Specific
```go
// Cyclic sort
func cyclicSort(nums []int) {
    i := 0
    for i < len(nums) {
        correctIndex := nums[i] - 1
        if nums[i] != nums[correctIndex] {
            nums[i], nums[correctIndex] = nums[correctIndex], nums[i]
        } else {
            i++
        }
    }
}

// Find duplicate number
func findDuplicate(nums []int) int {
    i := 0
    for i < len(nums) {
        if nums[i] != i+1 {
            correctIndex := nums[i] - 1
            if nums[i] != nums[correctIndex] {
                nums[i], nums[correctIndex] = nums[correctIndex], nums[i]
            } else {
                return nums[i]  // Found duplicate
            }
        } else {
            i++
        }
    }
    return -1
}
```

### Rust Specific
```rust
// Cyclic sort
fn cyclic_sort(nums: &mut Vec<i32>) {
    let mut i = 0;
    while i < nums.len() {
        let correct_index = (nums[i] - 1) as usize;
        if correct_index < nums.len() && nums[i] != nums[correct_index] {
            nums.swap(i, correct_index);
        } else {
            i += 1;
        }
    }
}

// Find missing numbers
fn find_missing_numbers(nums: &mut Vec<i32>) -> Vec<i32> {
    let mut i = 0;

    // Sort using cyclic sort
    while i < nums.len() {
        let correct_index = (nums[i] - 1) as usize;
        if correct_index < nums.len() && nums[i] != nums[correct_index] {
            nums.swap(i, correct_index);
        } else {
            i += 1;
        }
    }

    // Find missing numbers
    let mut missing = Vec::new();
    for (i, &num) in nums.iter().enumerate() {
        if num != (i + 1) as i32 {
            missing.push((i + 1) as i32);
        }
    }

    missing
}
```

## Time/Space Complexity
- **Time**: O(n) - each element is moved at most once to its correct position
- **Space**: O(1) - sorting is done in-place with constant extra space

## Problems Solved
- [ ] Problem 1 (Easy) - [Link to folder]
- [ ] Problem 2 (Medium) - [Link to folder]
- [ ] Problem 3 (Hard) - [Link to folder]

## Resources
- **Educative**: Grokking Coding Interview - Cyclic Sort
- **Book Reference**: Array sorting algorithms
- **neetcode.io**: Array problems with cyclic sort
