# Fibonacci Numbers Pattern

## When to Use
- Problems that can be solved using the Fibonacci sequence recurrence relation
- Optimization problems where current state depends on previous 1-2 states
- Counting problems with overlapping subproblems
- Problems involving steps, climbing, or sequential decision making
- Dynamic programming problems with simple state transitions

## Key Insights
- Classic recurrence: F(n) = F(n-1) + F(n-2) with base cases F(0) = 0, F(1) = 1
- Exponential naive recursion can be optimized to linear time with DP
- Space can often be optimized from O(n) to O(1) by keeping only last few values
- Many problems follow similar pattern but with different base cases or recurrence
- Matrix exponentiation can solve in O(log n) time for very large n

## Common Variations
- **Classic Fibonacci**: Generate nth Fibonacci number
- **Climbing Stairs**: Count ways to reach nth step taking 1 or 2 steps
- **House Robber**: Maximum money without robbing adjacent houses
- **Minimum Cost Climbing Stairs**: Find minimum cost to reach top
- **Tribonacci**: Each number is sum of previous three numbers

## Implementation Notes
### Python Specific
```python
# Basic recursive (inefficient)
def fib_recursive(n):
    if n <= 1:
        return n
    return fib_recursive(n-1) + fib_recursive(n-2)

# Memoization (top-down DP)
def fib_memo(n, memo={}):
    if n in memo:
        return memo[n]
    if n <= 1:
        return n
    memo[n] = fib_memo(n-1, memo) + fib_memo(n-2, memo)
    return memo[n]

# Bottom-up DP
def fib_dp(n):
    if n <= 1:
        return n
    dp = [0, 1]
    for i in range(2, n + 1):
        dp.append(dp[i-1] + dp[i-2])
    return dp[n]

# Space optimized O(1)
def fib_optimized(n):
    if n <= 1:
        return n
    a, b = 0, 1
    for _ in range(2, n + 1):
        a, b = b, a + b
    return b
```

### Go Specific
```go
// Space optimized approach
func fibonacci(n int) int {
    if n <= 1 {
        return n
    }

    a, b := 0, 1
    for i := 2; i <= n; i++ {
        a, b = b, a+b
    }
    return b
}

// DP with array
func fibonacciDP(n int) int {
    if n <= 1 {
        return n
    }

    dp := make([]int, n+1)
    dp[0], dp[1] = 0, 1

    for i := 2; i <= n; i++ {
        dp[i] = dp[i-1] + dp[i-2]
    }

    return dp[n]
}
```

### Rust Specific
```rust
// Space optimized
fn fibonacci(n: u32) -> u64 {
    match n {
        0 | 1 => n as u64,
        _ => {
            let (mut a, mut b) = (0u64, 1u64);
            for _ in 2..=n {
                let temp = a + b;
                a = b;
                b = temp;
            }
            b
        }
    }
}

// With memoization
use std::collections::HashMap;

fn fib_memo(n: u32, memo: &mut HashMap<u32, u64>) -> u64 {
    if let Some(&result) = memo.get(&n) {
        return result;
    }

    let result = match n {
        0 | 1 => n as u64,
        _ => fib_memo(n - 1, memo) + fib_memo(n - 2, memo),
    };

    memo.insert(n, result);
    result
}
```

## Time/Space Complexity
- **Naive Recursive**: Time O(2^n), Space O(n) for call stack
- **Memoization**: Time O(n), Space O(n) for memo table
- **Bottom-up DP**: Time O(n), Space O(n) for DP array
- **Space Optimized**: Time O(n), Space O(1)
- **Matrix Exponentiation**: Time O(log n), Space O(1)

## Problems Solved
- [ ] Problem 1 (Easy) - [Link to folder]
- [ ] Problem 2 (Medium) - [Link to folder]
- [ ] Problem 3 (Hard) - [Link to folder]

## Resources
- **Educative**: Grokking Dynamic Programming - Fibonacci Numbers
- **Book Reference**: CLRS Chapter 15 - Dynamic Programming
- **neetcode.io**: Dynamic Programming playlist
