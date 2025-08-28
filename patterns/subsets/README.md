# Subsets Pattern

## When to Use
- Problems requiring generation of all possible subsets, permutations, or combinations
- Need to explore all possible selections from a given set
- Problems involving power sets or combinatorial enumeration
- When you need to find all ways to partition or group elements
- Backtracking problems that involve making choices about including/excluding elements

## Key Insights
- Use backtracking to make binary decisions (include/exclude) for each element
- Build subsets incrementally by adding/removing elements
- Can use iterative approach with bit manipulation for power sets
- For permutations, consider order; for combinations, order doesn't matter
- Duplicate elements require special handling to avoid duplicate subsets

## Common Variations
- **All Subsets**: Generate all possible subsets of a given set
- **Subsets with Duplicates**: Handle duplicate elements in input
- **Permutations**: Generate all possible arrangements of elements
- **Combinations**: Generate all ways to choose K elements from N
- **Palindromic Partitioning**: Partition string into palindromic substrings
- **Letter Case Permutation**: Generate permutations by changing case

## Implementation Notes
### Python Specific
```python
# Generate all subsets using backtracking
def subsets(nums):
    result = []

    def backtrack(start, path):
        result.append(path[:])  # Add current subset

        for i in range(start, len(nums)):
            path.append(nums[i])  # Include element
            backtrack(i + 1, path)  # Recurse
            path.pop()  # Exclude element (backtrack)

    backtrack(0, [])
    return result

# Generate subsets with duplicates
def subsets_with_dup(nums):
    nums.sort()  # Sort to handle duplicates
    result = []

    def backtrack(start, path):
        result.append(path[:])

        for i in range(start, len(nums)):
            # Skip duplicates
            if i > start and nums[i] == nums[i - 1]:
                continue

            path.append(nums[i])
            backtrack(i + 1, path)
            path.pop()

    backtrack(0, [])
    return result

# Generate permutations
def permute(nums):
    result = []

    def backtrack(path):
        if len(path) == len(nums):
            result.append(path[:])
            return

        for num in nums:
            if num in path:
                continue
            path.append(num)
            backtrack(path)
            path.pop()

    backtrack([])
    return result

# Iterative approach using bit manipulation
def subsets_iterative(nums):
    n = len(nums)
    result = []

    # Generate all numbers from 0 to 2^n - 1
    for i in range(1 << n):
        subset = []
        for j in range(n):
            # Check if jth bit is set
            if i & (1 << j):
                subset.append(nums[j])
        result.append(subset)

    return result
```

### Go Specific
```go
// Generate all subsets
func subsets(nums []int) [][]int {
    result := [][]int{}

    var backtrack func(start int, path []int)
    backtrack = func(start int, path []int) {
        // Add current subset to result
        subset := make([]int, len(path))
        copy(subset, path)
        result = append(result, subset)

        for i := start; i < len(nums); i++ {
            path = append(path, nums[i])  // Include
            backtrack(i+1, path)          // Recurse
            path = path[:len(path)-1]     // Exclude (backtrack)
        }
    }

    backtrack(0, []int{})
    return result
}

// Generate permutations
func permute(nums []int) [][]int {
    result := [][]int{}

    var backtrack func(path []int, used []bool)
    backtrack = func(path []int, used []bool) {
        if len(path) == len(nums) {
            perm := make([]int, len(path))
            copy(perm, path)
            result = append(result, perm)
            return
        }

        for i := 0; i < len(nums); i++ {
            if used[i] {
                continue
            }

            path = append(path, nums[i])
            used[i] = true
            backtrack(path, used)
            path = path[:len(path)-1]
            used[i] = false
        }
    }

    used := make([]bool, len(nums))
    backtrack([]int{}, used)
    return result
}

// Combinations
func combine(n int, k int) [][]int {
    result := [][]int{}

    var backtrack func(start int, path []int)
    backtrack = func(start int, path []int) {
        if len(path) == k {
            combination := make([]int, len(path))
            copy(combination, path)
            result = append(result, combination)
            return
        }

        for i := start; i <= n; i++ {
            path = append(path, i)
            backtrack(i+1, path)
            path = path[:len(path)-1]
        }
    }

    backtrack(1, []int{})
    return result
}
```

### Rust Specific
```rust
// Generate all subsets
fn subsets(nums: Vec<i32>) -> Vec<Vec<i32>> {
    let mut result = Vec::new();
    let mut path = Vec::new();

    fn backtrack(nums: &[i32], start: usize, path: &mut Vec<i32>, result: &mut Vec<Vec<i32>>) {
        result.push(path.clone());

        for i in start..nums.len() {
            path.push(nums[i]);
            backtrack(nums, i + 1, path, result);
            path.pop();
        }
    }

    backtrack(&nums, 0, &mut path, &mut result);
    result
}

// Generate permutations
fn permute(nums: Vec<i32>) -> Vec<Vec<i32>> {
    let mut result = Vec::new();
    let mut path = Vec::new();
    let mut used = vec![false; nums.len()];

    fn backtrack(
        nums: &[i32],
        path: &mut Vec<i32>,
        used: &mut Vec<bool>,
        result: &mut Vec<Vec<i32>>
    ) {
        if path.len() == nums.len() {
            result.push(path.clone());
            return;
        }

        for i in 0..nums.len() {
            if used[i] {
                continue;
            }

            path.push(nums[i]);
            used[i] = true;
            backtrack(nums, path, used, result);
            path.pop();
            used[i] = false;
        }
    }

    backtrack(&nums, &mut path, &mut used, &mut result);
    result
}

// Iterative approach using bit manipulation
fn subsets_iterative(nums: Vec<i32>) -> Vec<Vec<i32>> {
    let n = nums.len();
    let mut result = Vec::new();

    for i in 0..(1 << n) {
        let mut subset = Vec::new();
        for j in 0..n {
            if i & (1 << j) != 0 {
                subset.push(nums[j]);
            }
        }
        result.push(subset);
    }

    result
}

// Handle subsets with duplicates
fn subsets_with_dup(mut nums: Vec<i32>) -> Vec<Vec<i32>> {
    nums.sort();
    let mut result = Vec::new();
    let mut path = Vec::new();

    fn backtrack(
        nums: &[i32],
        start: usize,
        path: &mut Vec<i32>,
        result: &mut Vec<Vec<i32>>
    ) {
        result.push(path.clone());

        for i in start..nums.len() {
            // Skip duplicates
            if i > start && nums[i] == nums[i - 1] {
                continue;
            }

            path.push(nums[i]);
            backtrack(nums, i + 1, path, result);
            path.pop();
        }
    }

    backtrack(&nums, 0, &mut path, &mut result);
    result
}
```

## Time/Space Complexity
- **Subsets**: Time O(2^n × n), Space O(2^n × n) - 2^n subsets, each of average size n/2
- **Permutations**: Time O(n! × n), Space O(n! × n) - n! permutations, each of size n
- **Combinations C(n,k)**: Time O(C(n,k) × k), Space O(C(n,k) × k)
- **Bit manipulation**: Time O(2^n × n), Space O(2^n × n)

## Problems Solved
- [ ] Problem 1 (Medium) - [Link to folder]
- [ ] Problem 2 (Medium) - [Link to folder]
- [ ] Problem 3 (Hard) - [Link to folder]

## Resources
- **Educative**: Grokking Coding Interview - Subsets
- **Book Reference**: Combinatorial algorithms
- **neetcode.io**: Backtracking playlist
