# Dynamic Programming Pattern

## When to Use
- Problems with overlapping subproblems that can be solved recursively
- Optimization problems (finding maximum, minimum, or count)
- Problems that can be broken down into smaller subproblems
- When brute force recursion leads to exponential time complexity
- Decision-making problems where choices affect future outcomes

## Key Insights
- **Optimal Substructure**: Solution can be constructed from optimal solutions of subproblems
- **Overlapping Subproblems**: Same subproblems are solved multiple times in naive recursion
- **Memoization**: Store results of subproblems to avoid recomputation
- **Bottom-up vs Top-down**: Build solution from base cases up, or use recursion with memoization
- **State definition**: Identify what parameters uniquely define a subproblem

## Common Variations
- **Linear DP**: 1D array, each state depends on previous states
- **Grid DP**: 2D problems like paths in matrix
- **Interval DP**: Problems on subarrays or subsequences
- **Tree DP**: Dynamic programming on trees
- **Bitmask DP**: Use bitmasks to represent states
- **Digit DP**: Problems involving digits of numbers

## Implementation Notes
### Python Specific
```python
# Top-down memoization
def dp_recursive(n, memo={}):
    if n in memo:
        return memo[n]

    if n <= 1:  # Base case
        return n

    memo[n] = dp_recursive(n-1, memo) + dp_recursive(n-2, memo)
    return memo[n]

# Bottom-up tabulation
def dp_iterative(n):
    if n <= 1:
        return n

    dp = [0] * (n + 1)
    dp[1] = 1

    for i in range(2, n + 1):
        dp[i] = dp[i-1] + dp[i-2]

    return dp[n]

# Space optimized
def dp_optimized(n):
    if n <= 1:
        return n

    prev2, prev1 = 0, 1
    for i in range(2, n + 1):
        current = prev1 + prev2
        prev2, prev1 = prev1, current

    return prev1
```

### Go Specific
```go
// Memoization with map
func dpRecursive(n int, memo map[int]int) int {
    if val, exists := memo[n]; exists {
        return val
    }

    if n <= 1 {
        return n
    }

    memo[n] = dpRecursive(n-1, memo) + dpRecursive(n-2, memo)
    return memo[n]
}

// Bottom-up approach
func dpIterative(n int) int {
    if n <= 1 {
        return n
    }

    dp := make([]int, n+1)
    dp[1] = 1

    for i := 2; i <= n; i++ {
        dp[i] = dp[i-1] + dp[i-2]
    }

    return dp[n]
}
```

### Rust Specific
```rust
use std::collections::HashMap;

// Top-down with memoization
fn dp_recursive(n: i32, memo: &mut HashMap<i32, i32>) -> i32 {
    if let Some(&result) = memo.get(&n) {
        return result;
    }

    let result = match n {
        0 | 1 => n,
        _ => dp_recursive(n - 1, memo) + dp_recursive(n - 2, memo),
    };

    memo.insert(n, result);
    result
}

// Bottom-up approach
fn dp_iterative(n: i32) -> i32 {
    if n <= 1 {
        return n;
    }

    let mut dp = vec![0; (n + 1) as usize];
    dp[1] = 1;

    for i in 2..=n as usize {
        dp[i] = dp[i - 1] + dp[i - 2];
    }

    dp[n as usize]
}
```

## Time/Space Complexity
- **Time**: Usually O(n) to O(n²) or O(n³) depending on number of states and transitions
- **Space**: O(n) to O(n²) for memoization table, can often be optimized to O(1)

## Problems Solved
- [ ] 0-1 Knapsack (Medium) - [Link](0-1-knapsack/)
- [ ] Fibonacci Numbers (Easy) - [Link](fibonacci-numbers/)
- [ ] Longest Common Subsequence (Medium) - [Link](longest-common-subsequence/)
- [ ] Palindromic Subsequence (Medium) - [Link](palindromic-subsequence/)
- [ ] Unbounded Knapsack (Medium) - [Link](unbounded-knapsack/)

## Resources
- **Educative**: Grokking Dynamic Programming Patterns
- **Book Reference**: CLRS Chapter 15 - Dynamic Programming
- **neetcode.io**: Dynamic Programming playlist
