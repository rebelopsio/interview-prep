# Backtracking Pattern

## When to Use
- Need to explore all possible solutions to find the optimal one
- Problems that require generating all combinations, permutations, or arrangements
- Constraint satisfaction problems (N-Queens, Sudoku solving)
- Path-finding problems where you need to explore multiple routes
- Decision tree problems where you make choices and potentially backtrack

## Key Insights
- Build solution incrementally by making choices
- Backtrack (undo choice) when current path cannot lead to valid solution
- Use recursion to explore all possible paths
- Prune invalid branches early to improve efficiency
- Three key components: Choose, Explore, Unchoose

## Common Variations
- **Combination Problems**: Generate all possible combinations
- **Permutation Problems**: Generate all possible arrangements
- **Subset Generation**: Find all subsets of a given set
- **Constraint Satisfaction**: Solve puzzles with specific rules
- **Path Finding**: Find all paths in a graph/grid

## Implementation Notes
### Python Specific
```python
# Classic backtracking template
def backtrack(path, choices):
    if is_valid_solution(path):
        result.append(path.copy())
        return

    for choice in choices:
        if is_valid_choice(choice, path):
            # Choose
            path.append(choice)
            # Explore
            backtrack(path, get_next_choices(choice))
            # Unchoose
            path.pop()
```

### Go Specific
```go
// Backtracking template
func backtrack(path []int, choices []int, result *[][]int) {
    if isValidSolution(path) {
        temp := make([]int, len(path))
        copy(temp, path)
        *result = append(*result, temp)
        return
    }

    for _, choice := range choices {
        if isValidChoice(choice, path) {
            // Choose
            path = append(path, choice)
            // Explore
            backtrack(path, getNextChoices(choice), result)
            // Unchoose
            path = path[:len(path)-1]
        }
    }
}
```

### Rust Specific
```rust
// Backtracking template
fn backtrack(path: &mut Vec<i32>, choices: &[i32], result: &mut Vec<Vec<i32>>) {
    if is_valid_solution(path) {
        result.push(path.clone());
        return;
    }

    for &choice in choices {
        if is_valid_choice(choice, path) {
            // Choose
            path.push(choice);
            // Explore
            backtrack(path, &get_next_choices(choice), result);
            // Unchoose
            path.pop();
        }
    }
}
```

## Time/Space Complexity
- **Time**: Often O(2^n) or O(n!) depending on problem (exponential)
- **Space**: O(depth of recursion) for call stack + O(solution size)

## Problems Solved
- [ ] Problem 1 (Medium) - [Link to folder]
- [ ] Problem 2 (Medium) - [Link to folder]
- [ ] Problem 3 (Hard) - [Link to folder]

## Resources
- **Educative**: Grokking Coding Interview - Backtracking
- **Book Reference**: CLRS Chapter 8
- **neetcode.io**: Backtracking playlist
