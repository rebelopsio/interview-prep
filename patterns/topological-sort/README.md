# Topological Sort Pattern

## When to Use
- Problems involving directed acyclic graphs (DAGs) with dependencies
- Need to find ordering of tasks with prerequisites or dependencies
- Course scheduling problems with prerequisite relationships
- Build system dependency resolution
- Finding valid ordering in directed graphs without cycles

## Key Insights
- Topological sort only works on Directed Acyclic Graphs (DAGs)
- Use in-degree (number of incoming edges) to track dependencies
- Process nodes with zero in-degree first (no dependencies)
- Two main approaches: Kahn's algorithm (BFS) and DFS-based
- Can detect cycles - if cycle exists, topological sort is impossible

## Common Variations
- **Course Schedule**: Determine if all courses can be finished given prerequisites
- **Alien Dictionary**: Find order of characters in alien language
- **Task Scheduling**: Find valid order to complete tasks with dependencies
- **Build Order**: Determine compilation order for projects with dependencies
- **Sequence Reconstruction**: Check if sequence can be uniquely reconstructed

## Implementation Notes
### Python Specific
```python
from collections import defaultdict, deque

# Kahn's Algorithm (BFS approach)
def topological_sort_bfs(vertices, edges):
    # Build adjacency list and in-degree count
    graph = defaultdict(list)
    in_degree = {i: 0 for i in range(vertices)}

    for parent, child in edges:
        graph[parent].append(child)
        in_degree[child] += 1

    # Find all nodes with no incoming edges
    queue = deque([node for node in in_degree if in_degree[node] == 0])
    result = []

    while queue:
        node = queue.popleft()
        result.append(node)

        # Remove this node from graph and update in-degrees
        for neighbor in graph[node]:
            in_degree[neighbor] -= 1
            if in_degree[neighbor] == 0:
                queue.append(neighbor)

    # Check for cycle
    if len(result) != vertices:
        return []  # Cycle detected

    return result

# DFS approach
def topological_sort_dfs(vertices, edges):
    graph = defaultdict(list)
    for parent, child in edges:
        graph[parent].append(child)

    visited = set()
    rec_stack = set()
    result = []

    def dfs(node):
        if node in rec_stack:
            return False  # Cycle detected
        if node in visited:
            return True

        visited.add(node)
        rec_stack.add(node)

        for neighbor in graph[node]:
            if not dfs(neighbor):
                return False

        rec_stack.remove(node)
        result.append(node)
        return True

    for node in range(vertices):
        if node not in visited:
            if not dfs(node):
                return []  # Cycle detected

    return result[::-1]  # Reverse for correct order
```

### Go Specific
```go
// Kahn's Algorithm implementation
func topologicalSort(vertices int, edges [][]int) []int {
    graph := make([][]int, vertices)
    inDegree := make([]int, vertices)

    // Build graph and calculate in-degrees
    for _, edge := range edges {
        parent, child := edge[0], edge[1]
        graph[parent] = append(graph[parent], child)
        inDegree[child]++
    }

    // Find all nodes with no incoming edges
    queue := []int{}
    for i := 0; i < vertices; i++ {
        if inDegree[i] == 0 {
            queue = append(queue, i)
        }
    }

    result := []int{}

    for len(queue) > 0 {
        node := queue[0]
        queue = queue[1:]
        result = append(result, node)

        // Update in-degrees of neighbors
        for _, neighbor := range graph[node] {
            inDegree[neighbor]--
            if inDegree[neighbor] == 0 {
                queue = append(queue, neighbor)
            }
        }
    }

    // Check for cycle
    if len(result) != vertices {
        return []int{} // Cycle detected
    }

    return result
}

// Course schedule problem
func canFinish(numCourses int, prerequisites [][]int) bool {
    inDegree := make([]int, numCourses)
    graph := make([][]int, numCourses)

    for _, prereq := range prerequisites {
        course, pre := prereq[0], prereq[1]
        graph[pre] = append(graph[pre], course)
        inDegree[course]++
    }

    queue := []int{}
    for i := 0; i < numCourses; i++ {
        if inDegree[i] == 0 {
            queue = append(queue, i)
        }
    }

    completed := 0
    for len(queue) > 0 {
        course := queue[0]
        queue = queue[1:]
        completed++

        for _, nextCourse := range graph[course] {
            inDegree[nextCourse]--
            if inDegree[nextCourse] == 0 {
                queue = append(queue, nextCourse)
            }
        }
    }

    return completed == numCourses
}
```

### Rust Specific
```rust
use std::collections::{HashMap, VecDeque};

// Kahn's Algorithm
fn topological_sort(vertices: usize, edges: Vec<(usize, usize)>) -> Vec<usize> {
    let mut graph: HashMap<usize, Vec<usize>> = HashMap::new();
    let mut in_degree = vec![0; vertices];

    // Build graph and calculate in-degrees
    for (parent, child) in edges {
        graph.entry(parent).or_insert_with(Vec::new).push(child);
        in_degree[child] += 1;
    }

    // Find nodes with no incoming edges
    let mut queue: VecDeque<usize> = VecDeque::new();
    for (i, &degree) in in_degree.iter().enumerate() {
        if degree == 0 {
            queue.push_back(i);
        }
    }

    let mut result = Vec::new();

    while let Some(node) = queue.pop_front() {
        result.push(node);

        if let Some(neighbors) = graph.get(&node) {
            for &neighbor in neighbors {
                in_degree[neighbor] -= 1;
                if in_degree[neighbor] == 0 {
                    queue.push_back(neighbor);
                }
            }
        }
    }

    // Check for cycle
    if result.len() != vertices {
        return Vec::new(); // Cycle detected
    }

    result
}

// DFS-based topological sort
fn topological_sort_dfs(vertices: usize, edges: Vec<(usize, usize)>) -> Vec<usize> {
    let mut graph: HashMap<usize, Vec<usize>> = HashMap::new();

    for (parent, child) in edges {
        graph.entry(parent).or_insert_with(Vec::new).push(child);
    }

    let mut visited = vec![false; vertices];
    let mut rec_stack = vec![false; vertices];
    let mut result = Vec::new();

    fn dfs(
        node: usize,
        graph: &HashMap<usize, Vec<usize>>,
        visited: &mut Vec<bool>,
        rec_stack: &mut Vec<bool>,
        result: &mut Vec<usize>,
    ) -> bool {
        if rec_stack[node] {
            return false; // Cycle detected
        }
        if visited[node] {
            return true;
        }

        visited[node] = true;
        rec_stack[node] = true;

        if let Some(neighbors) = graph.get(&node) {
            for &neighbor in neighbors {
                if !dfs(neighbor, graph, visited, rec_stack, result) {
                    return false;
                }
            }
        }

        rec_stack[node] = false;
        result.push(node);
        true
    }

    for node in 0..vertices {
        if !visited[node] {
            if !dfs(node, &graph, &mut visited, &mut rec_stack, &mut result) {
                return Vec::new(); // Cycle detected
            }
        }
    }

    result.reverse();
    result
}
```

## Time/Space Complexity
- **Kahn's Algorithm**: Time O(V + E), Space O(V + E) where V is vertices and E is edges
- **DFS approach**: Time O(V + E), Space O(V + E) plus O(V) for recursion stack
- **Both approaches** visit each vertex and edge exactly once

## Problems Solved
- [ ] Problem 1 (Medium) - [Link to folder]
- [ ] Problem 2 (Medium) - [Link to folder]
- [ ] Problem 3 (Hard) - [Link to folder]

## Resources
- **Educative**: Grokking Coding Interview - Topological Sort
- **Book Reference**: CLRS Chapter 22 - Elementary Graph Algorithms
- **neetcode.io**: Graph algorithms playlist
