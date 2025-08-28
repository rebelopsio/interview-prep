# Tree Depth First Search Pattern

## When to Use
- Problems involving tree or graph traversal where you need to go deep before wide
- Need to explore all paths from root to leaves
- Looking for specific paths, values, or patterns in trees
- Problems requiring backtracking through tree structures
- Need to calculate tree properties like height, diameter, or path sums

## Key Insights
- Use recursion or explicit stack to traverse tree depth-first
- Three main orders: preorder (root-left-right), inorder (left-root-right), postorder (left-right-root)
- Preorder useful for tree copying and serialization
- Inorder gives sorted sequence for BST
- Postorder useful for tree deletion and calculating subtree properties
- DFS explores one branch completely before moving to next

## Common Variations
- **Preorder Traversal**: Process root, then left subtree, then right subtree
- **Inorder Traversal**: Process left subtree, then root, then right subtree
- **Postorder Traversal**: Process left subtree, then right subtree, then root
- **Path Sum Problems**: Find paths with specific sum values
- **Tree Diameter**: Find longest path between any two nodes
- **Lowest Common Ancestor**: Find LCA of two nodes

## Implementation Notes
### Python Specific
```python
# Basic DFS traversals (recursive)
def preorder_traversal(root):
    if not root:
        return []
    return [root.val] + preorder_traversal(root.left) + preorder_traversal(root.right)

def inorder_traversal(root):
    if not root:
        return []
    return inorder_traversal(root.left) + [root.val] + inorder_traversal(root.right)

def postorder_traversal(root):
    if not root:
        return []
    return postorder_traversal(root.left) + postorder_traversal(root.right) + [root.val]

# Iterative DFS using stack
def dfs_iterative(root):
    if not root:
        return []

    result = []
    stack = [root]

    while stack:
        node = stack.pop()
        result.append(node.val)

        # Add right child first so left is processed first
        if node.right:
            stack.append(node.right)
        if node.left:
            stack.append(node.left)

    return result

# Path sum example
def has_path_sum(root, target_sum):
    if not root:
        return False

    if not root.left and not root.right:  # Leaf node
        return root.val == target_sum

    remaining_sum = target_sum - root.val
    return (has_path_sum(root.left, remaining_sum) or
            has_path_sum(root.right, remaining_sum))
```

### Go Specific
```go
// TreeNode definition
type TreeNode struct {
    Val   int
    Left  *TreeNode
    Right *TreeNode
}

// Preorder traversal (recursive)
func preorderTraversal(root *TreeNode) []int {
    if root == nil {
        return []int{}
    }

    result := []int{root.Val}
    result = append(result, preorderTraversal(root.Left)...)
    result = append(result, preorderTraversal(root.Right)...)

    return result
}

// DFS with helper function
func dfsHelper(root *TreeNode, result *[]int) {
    if root == nil {
        return
    }

    *result = append(*result, root.Val)
    dfsHelper(root.Left, result)
    dfsHelper(root.Right, result)
}

// Calculate tree height
func maxDepth(root *TreeNode) int {
    if root == nil {
        return 0
    }

    leftDepth := maxDepth(root.Left)
    rightDepth := maxDepth(root.Right)

    return 1 + max(leftDepth, rightDepth)
}

// Path sum problem
func hasPathSum(root *TreeNode, targetSum int) bool {
    if root == nil {
        return false
    }

    if root.Left == nil && root.Right == nil {
        return root.Val == targetSum
    }

    remainingSum := targetSum - root.Val
    return hasPathSum(root.Left, remainingSum) || hasPathSum(root.Right, remainingSum)
}
```

### Rust Specific
```rust
use std::rc::Rc;
use std::cell::RefCell;

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

// Preorder traversal
fn preorder_traversal(root: Option<Rc<RefCell<TreeNode>>>) -> Vec<i32> {
    match root {
        None => vec![],
        Some(node) => {
            let node = node.borrow();
            let mut result = vec![node.val];
            result.extend(preorder_traversal(node.left.clone()));
            result.extend(preorder_traversal(node.right.clone()));
            result
        }
    }
}

// Calculate maximum depth
fn max_depth(root: Option<Rc<RefCell<TreeNode>>>) -> i32 {
    match root {
        None => 0,
        Some(node) => {
            let node = node.borrow();
            let left_depth = max_depth(node.left.clone());
            let right_depth = max_depth(node.right.clone());
            1 + left_depth.max(right_depth)
        }
    }
}

// Path sum check
fn has_path_sum(root: Option<Rc<RefCell<TreeNode>>>, target_sum: i32) -> bool {
    match root {
        None => false,
        Some(node) => {
            let node = node.borrow();

            // Check if it's a leaf node
            if node.left.is_none() && node.right.is_none() {
                return node.val == target_sum;
            }

            let remaining_sum = target_sum - node.val;
            has_path_sum(node.left.clone(), remaining_sum) ||
            has_path_sum(node.right.clone(), remaining_sum)
        }
    }
}
```

## Time/Space Complexity
- **Time**: O(n) where n is the number of nodes (visit each node once)
- **Space**: O(h) where h is height of tree (recursion stack), O(n) in worst case for skewed tree

## Problems Solved
- [ ] Problem 1 (Easy) - [Link to folder]
- [ ] Problem 2 (Medium) - [Link to folder]
- [ ] Problem 3 (Hard) - [Link to folder]

## Resources
- **Educative**: Grokking Coding Interview - Tree Depth First Search
- **Book Reference**: CLRS Chapter 22 - Elementary Graph Algorithms
- **neetcode.io**: Tree DFS playlist
