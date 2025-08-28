# Modified Binary Search Pattern

## When to Use
- Problems involving sorted arrays where you need to find a specific element or condition
- Search space can be reduced by half in each iteration
- Finding peak elements, rotation points, or boundaries in sorted data
- Problems that can be solved with "eliminate half" approach
- When you need to find first/last occurrence of elements or conditions

## Key Insights
- Use binary search template but modify the condition for specific problems
- Identify the search space and how to eliminate half of it in each step
- Three main templates: finding exact match, finding boundary, finding peak
- Pay attention to loop invariants and termination conditions
- Consider edge cases like duplicates, rotated arrays, or infinite arrays

## Common Variations
- **Search in Rotated Array**: Find element in rotated sorted array
- **First/Last Occurrence**: Find first or last position of target element
- **Peak Element**: Find any peak element in array where neighbors are smaller
- **Search Range**: Find starting and ending position of target in sorted array
- **Square Root**: Find integer square root using binary search
- **Search 2D Matrix**: Search in row-wise and column-wise sorted matrix

## Implementation Notes
### Python Specific
```python
# Basic binary search template
def binary_search(arr, target):
    left, right = 0, len(arr) - 1

    while left <= right:
        mid = left + (right - left) // 2

        if arr[mid] == target:
            return mid
        elif arr[mid] < target:
            left = mid + 1
        else:
            right = mid - 1

    return -1

# Find first occurrence
def find_first(arr, target):
    left, right = 0, len(arr) - 1
    result = -1

    while left <= right:
        mid = left + (right - left) // 2

        if arr[mid] == target:
            result = mid
            right = mid - 1  # Continue searching left
        elif arr[mid] < target:
            left = mid + 1
        else:
            right = mid - 1

    return result

# Search in rotated sorted array
def search_rotated(nums, target):
    left, right = 0, len(nums) - 1

    while left <= right:
        mid = left + (right - left) // 2

        if nums[mid] == target:
            return mid

        # Left half is sorted
        if nums[left] <= nums[mid]:
            if nums[left] <= target < nums[mid]:
                right = mid - 1
            else:
                left = mid + 1
        # Right half is sorted
        else:
            if nums[mid] < target <= nums[right]:
                left = mid + 1
            else:
                right = mid - 1

    return -1
```

### Go Specific
```go
// Basic binary search
func binarySearch(arr []int, target int) int {
    left, right := 0, len(arr)-1

    for left <= right {
        mid := left + (right-left)/2

        if arr[mid] == target {
            return mid
        } else if arr[mid] < target {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }

    return -1
}

// Find peak element
func findPeakElement(nums []int) int {
    left, right := 0, len(nums)-1

    for left < right {
        mid := left + (right-left)/2

        if nums[mid] > nums[mid+1] {
            right = mid
        } else {
            left = mid + 1
        }
    }

    return left
}

// Square root using binary search
func mySqrt(x int) int {
    if x < 2 {
        return x
    }

    left, right := 2, x/2

    for left <= right {
        mid := left + (right-left)/2
        num := mid * mid

        if num == x {
            return mid
        } else if num < x {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }

    return right
}
```

### Rust Specific
```rust
// Basic binary search
fn binary_search(arr: &[i32], target: i32) -> Option<usize> {
    let mut left = 0;
    let mut right = arr.len();

    while left < right {
        let mid = left + (right - left) / 2;

        match arr[mid].cmp(&target) {
            std::cmp::Ordering::Equal => return Some(mid),
            std::cmp::Ordering::Less => left = mid + 1,
            std::cmp::Ordering::Greater => right = mid,
        }
    }

    None
}

// Find first and last position
fn search_range(nums: Vec<i32>, target: i32) -> Vec<i32> {
    let first = find_first(&nums, target);
    let last = find_last(&nums, target);
    vec![first, last]
}

fn find_first(nums: &[i32], target: i32) -> i32 {
    let mut left = 0;
    let mut right = nums.len();
    let mut result = -1;

    while left < right {
        let mid = left + (right - left) / 2;

        if nums[mid] == target {
            result = mid as i32;
            right = mid;
        } else if nums[mid] < target {
            left = mid + 1;
        } else {
            right = mid;
        }
    }

    result
}

fn find_last(nums: &[i32], target: i32) -> i32 {
    let mut left = 0;
    let mut right = nums.len();
    let mut result = -1;

    while left < right {
        let mid = left + (right - left) / 2;

        if nums[mid] == target {
            result = mid as i32;
            left = mid + 1;
        } else if nums[mid] < target {
            left = mid + 1;
        } else {
            right = mid;
        }
    }

    result
}
```

## Time/Space Complexity
- **Time**: O(log n) for most binary search problems
- **Space**: O(1) for iterative approach, O(log n) for recursive due to call stack

## Problems Solved
- [ ] Problem 1 (Easy) - [Link to folder]
- [ ] Problem 2 (Medium) - [Link to folder]
- [ ] Problem 3 (Hard) - [Link to folder]

## Resources
- **Educative**: Grokking Coding Interview - Modified Binary Search
- **Book Reference**: CLRS Chapter 2 - Getting Started
- **neetcode.io**: Binary Search playlist
