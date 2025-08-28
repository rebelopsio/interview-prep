# 0-1 Knapsack Pattern

## When to Use
- Need to select items from a set where each item can only be taken once
- Have capacity constraints (weight, volume, etc.)
- Want to maximize/minimize some value while respecting constraints
- Problems involving "take it or leave it" decisions
- Optimization problems with discrete choices

## Key Insights
- Each item has two choices: include it or exclude it
- Build solution by considering all possible combinations
- Use dynamic programming to avoid recalculating subproblems
- Bottom-up approach often more efficient than recursive
- Can optimize space by using 1D array instead of 2D

## Common Variations
- **Classic Knapsack**: Maximize value within weight constraint
- **Subset Sum**: Find if subset exists that sums to target
- **Equal Subset Sum**: Partition array into two equal sum subsets
- **Minimum Subset Sum Difference**: Minimize difference between two subsets
- **Count of Subset Sum**: Count number of subsets with given sum

## Implementation Notes
### Python Specific
```python
# 2D DP approach
def knapsack(weights, values, capacity):
    n = len(weights)
    dp = [[0] * (capacity + 1) for _ in range(n + 1)]

    for i in range(1, n + 1):
        for w in range(capacity + 1):
            if weights[i-1] <= w:
                dp[i][w] = max(dp[i-1][w],
                              dp[i-1][w-weights[i-1]] + values[i-1])
            else:
                dp[i][w] = dp[i-1][w]

    return dp[n][capacity]
```

### Go Specific
```go
// 1D optimized approach
func knapsack(weights, values []int, capacity int) int {
    dp := make([]int, capacity+1)

    for i := 0; i < len(weights); i++ {
        for w := capacity; w >= weights[i]; w-- {
            dp[w] = max(dp[w], dp[w-weights[i]] + values[i])
        }
    }

    return dp[capacity]
}
```

### Rust Specific
```rust
// Space optimized approach
fn knapsack(weights: &[i32], values: &[i32], capacity: usize) -> i32 {
    let mut dp = vec![0; capacity + 1];

    for (weight, value) in weights.iter().zip(values.iter()) {
        for w in (*weight as usize..=capacity).rev() {
            dp[w] = dp[w].max(dp[w - *weight as usize] + value);
        }
    }

    dp[capacity]
}
```

## Time/Space Complexity
- **Time**: O(n × capacity) where n is number of items
- **Space**: O(capacity) with 1D optimization, O(n × capacity) with 2D array

## Problems Solved
- [ ] Problem 1 (Medium) - [Link to folder]
- [ ] Problem 2 (Medium) - [Link to folder]
- [ ] Problem 3 (Hard) - [Link to folder]

## Resources
- **Educative**: Grokking Dynamic Programming - 0/1 Knapsack
- **Book Reference**: CLRS Chapter 15
- **neetcode.io**: Dynamic Programming playlist
