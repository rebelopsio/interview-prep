# Tree Breadth First Search Pattern

## When to Use
- Problems requiring level-by-level tree traversal
- Need to explore nodes at current depth before going deeper
- Finding shortest path in unweighted trees
- Level order operations like printing tree levels
- Problems involving tree width, level averages, or level-specific operations

## Key Insights
- Use queue (FIFO) data structure to process nodes level by level
- Process all nodes at current level before moving to next level
- BFS guarantees shortest path in unweighted graphs/trees
- Useful for finding minimum depth or level-specific properties
- Can track level information using queue size or sentinel values

## Common Variations
- **Level Order Traversal**: Visit nodes level by level from left to right
- **Reverse Level Order**: Visit levels from bottom to top
- **Zigzag Traversal**: Alternate left-to-right and right-to-left per level
- **Minimum Depth**: Find shortest path from root to any leaf
- **Level Averages**: Calculate average value at each level
- **Level Maximum**: Find maximum value at each level

## Implementation Notes
### Python Specific
```python
from collections import deque

# Basic level order traversal
def level_order_traversal(root):
    if not root:
        return []

    result = []
    queue = deque([root])

    while queue:
        level_size = len(queue)
        current_level = []

        for _ in range(level_size):
            node = queue.popleft()
            current_level.append(node.val)

            if node.left:
                queue.append(node.left)
            if node.right:
                queue.append(node.right)

        result.append(current_level)

    return result

# Minimum depth using BFS
def min_depth(root):
    if not root:
        return 0

    queue = deque([(root, 1)])

    while queue:
        node, depth = queue.popleft()

        # Found first leaf node (shortest path)
        if not node.left and not node.right:
            return depth

        if node.left:
            queue.append((node.left, depth + 1))
        if node.right:
            queue.append((node.right, depth + 1))

    return 0
```

### Go Specific
```go
// TreeNode definition
type TreeNode struct {
    Val   int
    Left  *TreeNode
    Right *TreeNode
}

// Level order traversal
func levelOrder(root *TreeNode) [][]int {
    if root == nil {
        return [][]int{}
    }

    result := [][]int{}
    queue := []*TreeNode{root}

    for len(queue) > 0 {
        levelSize := len(queue)
        currentLevel := []int{}

        for i := 0; i < levelSize; i++ {
            node := queue[0]
            queue = queue[1:]  // Dequeue

            currentLevel = append(currentLevel, node.Val)

            if node.Left != nil {
                queue = append(queue, node.Left)
            }
            if node.Right != nil {
                queue = append(queue, node.Right)
            }
        }

        result = append(result, currentLevel)
    }

    return result
}

// Right side view using BFS
func rightSideView(root *TreeNode) []int {
    if root == nil {
        return []int{}
    }

    result := []int{}
    queue := []*TreeNode{root}

    for len(queue) > 0 {
        levelSize := len(queue)

        for i := 0; i < levelSize; i++ {
            node := queue[0]
            queue = queue[1:]

            // Last node in level (rightmost)
            if i == levelSize-1 {
                result = append(result, node.Val)
            }

            if node.Left != nil {
                queue = append(queue, node.Left)
            }
            if node.Right != nil {
                queue = append(queue, node.Right)
            }
        }
    }

    return result
}
```

### Rust Specific
```rust
use std::rc::Rc;
use std::cell::RefCell;
use std::collections::VecDeque;

// TreeNode definition
#[derive(Debug, PartialEq, Eq)]
pub struct TreeNode {
    pub val: i32,
    pub left: Option<Rc<RefCell<TreeNode>>>,
    pub right: Option<Rc<RefCell<TreeNode>>>,
}

impl TreeNode {
    #[inline]
    pub fn new(val: i32) -> Self {
        TreeNode {
            val,
            left: None,
            right: None,
        }
    }
}

// Level order traversal
fn level_order(root: Option<Rc<RefCell<TreeNode>>>) -> Vec<Vec<i32>> {
    let mut result = Vec::new();

    if let Some(root_node) = root {
        let mut queue = VecDeque::new();
        queue.push_back(root_node);

        while !queue.is_empty() {
            let level_size = queue.len();
            let mut current_level = Vec::new();

            for _ in 0..level_size {
                if let Some(node) = queue.pop_front() {
                    let node = node.borrow();
                    current_level.push(node.val);

                    if let Some(left) = node.left.clone() {
                        queue.push_back(left);
                    }
                    if let Some(right) = node.right.clone() {
                        queue.push_back(right);
                    }
                }
            }

            result.push(current_level);
        }
    }

    result
}

// Find minimum depth
fn min_depth(root: Option<Rc<RefCell<TreeNode>>>) -> i32 {
    if let Some(root_node) = root {
        let mut queue = VecDeque::new();
        queue.push_back((root_node, 1));

        while let Some((node, depth)) = queue.pop_front() {
            let node = node.borrow();

            // Check if it's a leaf node
            if node.left.is_none() && node.right.is_none() {
                return depth;
            }

            if let Some(left) = node.left.clone() {
                queue.push_back((left, depth + 1));
            }
            if let Some(right) = node.right.clone() {
                queue.push_back((right, depth + 1));
            }
        }
    }

    0
}
```

## Time/Space Complexity
- **Time**: O(n) where n is the number of nodes (visit each node once)
- **Space**: O(w) where w is maximum width of tree (queue storage), O(n) in worst case

## Problems Solved
- [ ] Problem 1 (Easy) - [Link to folder]
- [ ] Problem 2 (Medium) - [Link to folder]
- [ ] Problem 3 (Hard) - [Link to folder]

## Resources
- **Educative**: Grokking Coding Interview - Tree Breadth First Search
- **Book Reference**: CLRS Chapter 22 - Elementary Graph Algorithms
- **neetcode.io**: Tree BFS playlist
