# Trie Pattern

## When to Use
- Problems involving prefix-based searches or autocomplete functionality
- Need to efficiently store and search through a dictionary of words
- Finding words with common prefixes or suffixes
- Problems requiring word validation or spell checking
- Implementing search engines or text processors with prefix matching

## Key Insights
- Tree-like data structure where each node represents a character
- Root represents empty string, paths from root to leaves represent words
- Efficient for prefix operations: O(m) where m is length of word/prefix
- Space-time tradeoff: uses more memory but faster than hash-based approaches for prefix operations
- Can store additional information at nodes (word count, suggestions, etc.)

## Common Variations
- **Basic Trie**: Store and search words, check if word/prefix exists
- **Trie with Word Count**: Track frequency of each word
- **Auto-complete**: Find all words with given prefix
- **Word Search II**: Find all dictionary words in a 2D board
- **Replace Words**: Replace words with their shortest root form
- **Design Search Autocomplete**: Implement autocomplete system with ranking

## Implementation Notes
### Python Specific
```python
class TrieNode:
    def __init__(self):
        self.children = {}  # or [None] * 26 for lowercase letters only
        self.is_end_word = False
        self.word_count = 0  # Optional: for counting word frequency

class Trie:
    def __init__(self):
        self.root = TrieNode()

    def insert(self, word):
        node = self.root
        for char in word:
            if char not in node.children:
                node.children[char] = TrieNode()
            node = node.children[char]
        node.is_end_word = True
        node.word_count += 1

    def search(self, word):
        node = self.root
        for char in word:
            if char not in node.children:
                return False
            node = node.children[char]
        return node.is_end_word

    def starts_with(self, prefix):
        node = self.root
        for char in prefix:
            if char not in node.children:
                return False
            node = node.children[char]
        return True

    def get_words_with_prefix(self, prefix):
        node = self.root
        # Navigate to prefix end
        for char in prefix:
            if char not in node.children:
                return []
            node = node.children[char]

        # DFS to collect all words with this prefix
        words = []
        self._dfs_collect_words(node, prefix, words)
        return words

    def _dfs_collect_words(self, node, current_word, words):
        if node.is_end_word:
            words.append(current_word)

        for char, child_node in node.children.items():
            self._dfs_collect_words(child_node, current_word + char, words)
```

### Go Specific
```go
// TrieNode represents a node in the trie
type TrieNode struct {
    Children [26]*TrieNode // For lowercase letters only
    IsEndWord bool
    WordCount int
}

// Trie represents the trie data structure
type Trie struct {
    Root *TrieNode
}

// Constructor initializes a new trie
func Constructor() Trie {
    return Trie{Root: &TrieNode{}}
}

// Insert adds a word to the trie
func (t *Trie) Insert(word string) {
    node := t.Root
    for _, char := range word {
        index := char - 'a'
        if node.Children[index] == nil {
            node.Children[index] = &TrieNode{}
        }
        node = node.Children[index]
    }
    node.IsEndWord = true
    node.WordCount++
}

// Search returns true if word exists in trie
func (t *Trie) Search(word string) bool {
    node := t.Root
    for _, char := range word {
        index := char - 'a'
        if node.Children[index] == nil {
            return false
        }
        node = node.Children[index]
    }
    return node.IsEndWord
}

// StartsWith returns true if there's any word with given prefix
func (t *Trie) StartsWith(prefix string) bool {
    node := t.Root
    for _, char := range prefix {
        index := char - 'a'
        if node.Children[index] == nil {
            return false
        }
        node = node.Children[index]
    }
    return true
}

// GetWordsWithPrefix returns all words with given prefix
func (t *Trie) GetWordsWithPrefix(prefix string) []string {
    node := t.Root

    // Navigate to prefix end
    for _, char := range prefix {
        index := char - 'a'
        if node.Children[index] == nil {
            return []string{}
        }
        node = node.Children[index]
    }

    // Collect all words with this prefix
    words := []string{}
    t.dfsCollectWords(node, prefix, &words)
    return words
}

func (t *Trie) dfsCollectWords(node *TrieNode, currentWord string, words *[]string) {
    if node.IsEndWord {
        *words = append(*words, currentWord)
    }

    for i, child := range node.Children {
        if child != nil {
            char := string(rune('a' + i))
            t.dfsCollectWords(child, currentWord+char, words)
        }
    }
}
```

### Rust Specific
```rust
use std::collections::HashMap;

#[derive(Default)]
struct TrieNode {
    children: HashMap<char, TrieNode>,
    is_end_word: bool,
    word_count: usize,
}

impl TrieNode {
    fn new() -> Self {
        TrieNode {
            children: HashMap::new(),
            is_end_word: false,
            word_count: 0,
        }
    }
}

struct Trie {
    root: TrieNode,
}

impl Trie {
    fn new() -> Self {
        Trie {
            root: TrieNode::new(),
        }
    }

    fn insert(&mut self, word: String) {
        let mut node = &mut self.root;

        for ch in word.chars() {
            node = node.children.entry(ch).or_insert_with(TrieNode::new);
        }

        node.is_end_word = true;
        node.word_count += 1;
    }

    fn search(&self, word: String) -> bool {
        let mut node = &self.root;

        for ch in word.chars() {
            match node.children.get(&ch) {
                Some(next_node) => node = next_node,
                None => return false,
            }
        }

        node.is_end_word
    }

    fn starts_with(&self, prefix: String) -> bool {
        let mut node = &self.root;

        for ch in prefix.chars() {
            match node.children.get(&ch) {
                Some(next_node) => node = next_node,
                None => return false,
            }
        }

        true
    }

    fn get_words_with_prefix(&self, prefix: String) -> Vec<String> {
        let mut node = &self.root;

        // Navigate to prefix end
        for ch in prefix.chars() {
            match node.children.get(&ch) {
                Some(next_node) => node = next_node,
                None => return vec![],
            }
        }

        // Collect all words with this prefix
        let mut words = Vec::new();
        self.dfs_collect_words(node, &prefix, &mut words);
        words
    }

    fn dfs_collect_words(&self, node: &TrieNode, current_word: &str, words: &mut Vec<String>) {
        if node.is_end_word {
            words.push(current_word.to_string());
        }

        for (&ch, child_node) in &node.children {
            let mut new_word = current_word.to_string();
            new_word.push(ch);
            self.dfs_collect_words(child_node, &new_word, words);
        }
    }
}
```

## Time/Space Complexity
- **Insert**: Time O(m), Space O(m×n) where m is word length, n is number of words
- **Search**: Time O(m), Space O(1) for search operation
- **Prefix Search**: Time O(p) where p is prefix length
- **Space**: O(ALPHABET_SIZE × N × M) in worst case, more efficient with sparse data

## Problems Solved
- [ ] Problem 1 (Medium) - [Link to folder]
- [ ] Problem 2 (Medium) - [Link to folder]
- [ ] Problem 3 (Hard) - [Link to folder]

## Resources
- **Educative**: Grokking Coding Interview - Trie
- **Book Reference**: String processing and data structures
- **neetcode.io**: Trie / Prefix Tree playlist
