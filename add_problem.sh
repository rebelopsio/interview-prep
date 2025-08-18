#!/bin/bash

# Add Problem Script - Creates new problem structure for FAANG interview prep
# Usage: ./add-problem.sh <pattern> <problem-name> [leetcode-number] [difficulty]

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}✅${NC} $1"
}

print_info() {
    echo -e "${BLUE}ℹ️${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠️${NC} $1"
}

print_error() {
    echo -e "${RED}❌${NC} $1"
}

# Function to show usage
show_usage() {
    echo "Usage: $0 <pattern> <problem-name> [leetcode-number] [difficulty]"
    echo ""
    echo "Arguments:"
    echo "  pattern         Pattern name (e.g., 'two-pointers', 'sliding-window')"
    echo "  problem-name    Problem name (e.g., 'valid-palindrome', '3sum')"
    echo "  leetcode-number Optional LeetCode problem number (e.g., '125')"
    echo "  difficulty      Optional difficulty (Easy/Medium/Hard)"
    echo ""
    echo "Examples:"
    echo "  $0 two-pointers valid-palindrome 125 Easy"
    echo "  $0 sliding-window longest-substring-without-repeating 3 Medium"
    echo "  $0 dynamic-programming coin-change 322"
    echo ""
    echo "Available patterns:"
    if [ -d "patterns" ]; then
        for pattern in patterns/*/; do
            if [ -d "$pattern" ]; then
                basename "$pattern"
            fi
        done | sort | sed 's/^/  - /'
    else
        echo "  (Run from repository root where 'patterns' directory exists)"
    fi
}

# Validate arguments
if [ $# -lt 2 ]; then
    print_error "Missing required arguments"
    echo ""
    show_usage
    exit 1
fi

PATTERN="$1"
PROBLEM_NAME_RAW="$2"
LEETCODE_NUMBER="${3:-}"
DIFFICULTY="${4:-Medium}"

# Normalize problem name: lowercase and replace spaces with hyphens
PROBLEM_NAME=$(echo "$PROBLEM_NAME_RAW" | tr '[:upper:]' '[:lower:]' | sed 's/[[:space:]]/-/g' | sed 's/--*/-/g' | sed 's/^-\|-$//g')

# Display the normalized name if it changed
if [ "$PROBLEM_NAME" != "$PROBLEM_NAME_RAW" ]; then
    print_info "Normalized problem name: '$PROBLEM_NAME_RAW' → '$PROBLEM_NAME'"
fi

# Validate we're in the right directory
if [ ! -d "patterns" ]; then
    print_error "Must be run from repository root (patterns/ directory not found)"
    exit 1
fi

# Validate pattern exists
PATTERN_DIR="patterns/$PATTERN"
if [ ! -d "$PATTERN_DIR" ]; then
    print_error "Pattern '$PATTERN' not found in patterns/ directory"
    echo ""
    print_info "Available patterns:"
    for pattern in patterns/*/; do
        if [ -d "$pattern" ]; then
            echo "  - $(basename "$pattern")"
        fi
    done
    exit 1
fi

# Create problem directory
PROBLEM_DIR="$PATTERN_DIR/$PROBLEM_NAME"

if [ -d "$PROBLEM_DIR" ]; then
    print_warning "Problem directory '$PROBLEM_DIR' already exists"
    read -p "Continue and overwrite files? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        print_info "Aborted"
        exit 0
    fi
fi

mkdir -p "$PROBLEM_DIR"
print_status "Created directory: $PROBLEM_DIR"

# Generate problem README
print_info "Creating problem README..."

# Use the original raw name for display purposes in the README
DISPLAY_NAME=$(echo "$PROBLEM_NAME_RAW" | sed 's/\b\(.\)/\u\1/g')  # Title case

cat > "$PROBLEM_DIR/README.md" << EOF
# $DISPLAY_NAME

**Difficulty**: $DIFFICULTY
**Pattern**: $PATTERN
$([ -n "$LEETCODE_NUMBER" ] && echo "**LeetCode**: $LEETCODE_NUMBER")
**Educative**: [Course/Problem Reference]

## Problem Statement
[Brief description or link to problem]

## Approach
[Your strategy and thought process]

## Key Insights
- [What you learned]
- [Gotchas to remember]
- [Pattern recognition clues]

## Complexity
- **Time**: O(?)
- **Space**: O(?)

## Variations & Follow-ups
- [Common variations of this problem]
- [Interview follow-up questions]

## Related Problems
- [Similar problems to practice]

## Progress Checklist
- [ ] Understood the pattern
- [ ] Solved without hints (Go)
- [ ] Solved without hints (Rust)
- [ ] Solved without hints (Python)
- [ ] Optimized solution
- [ ] Can explain clearly
- [ ] Solved under time pressure
- [ ] Reviewed spaced repetition

## Notes
### Educative Insights
[Notes from AI Code Mentor, visualizations, etc.]

### neetcode.io Notes
[Video explanation insights, alternative approaches]

### Personal Notes
[Your own insights, mistakes made, things to remember]
EOF

# Create Go solution template
print_info "Creating Go solution template..."

cat > "$PROBLEM_DIR/solution.go" << EOF
package main

import "fmt"

// $DISPLAY_NAME - $DIFFICULTY
// Pattern: $PATTERN
$([ -n "$LEETCODE_NUMBER" ] && echo "// LeetCode: $LEETCODE_NUMBER")

func solve() {
    // TODO: Implement solution
    fmt.Println("Solution not implemented yet")
}

func main() {
    solve()
}

// Test cases
func runTests() {
    // TODO: Add test cases
    fmt.Println("Tests not implemented yet")
}

/*
Problem Analysis:
- Pattern: $PATTERN
- Time Complexity: O(?)
- Space Complexity: O(?)

Approach:
1. [Step 1]
2. [Step 2]
3. [Step 3]

Edge Cases:
- [Edge case 1]
- [Edge case 2]
*/
EOF

# Create Rust solution template
print_info "Creating Rust solution template..."

cat > "$PROBLEM_DIR/solution.rs" << EOF
// $DISPLAY_NAME - $DIFFICULTY
// Pattern: $PATTERN
$([ -n "$LEETCODE_NUMBER" ] && echo "// LeetCode: $LEETCODE_NUMBER")

fn solve() {
    // TODO: Implement solution
    println!("Solution not implemented yet");
}

fn main() {
    solve();
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_examples() {
        // TODO: Add test cases
        assert_eq!(1, 1);
    }
}

/*
Problem Analysis:
- Pattern: $PATTERN
- Time Complexity: O(?)
- Space Complexity: O(?)

Approach:
1. [Step 1]
2. [Step 2]
3. [Step 3]

Edge Cases:
- [Edge case 1]
- [Edge case 2]
*/
EOF

# Create Python solution template
print_info "Creating Python solution template..."

cat > "$PROBLEM_DIR/solution.py" << EOF
"""
$DISPLAY_NAME - $DIFFICULTY
Pattern: $PATTERN
$([ -n "$LEETCODE_NUMBER" ] && echo "LeetCode: $LEETCODE_NUMBER")
"""

def solve():
    """TODO: Implement solution"""
    print("Solution not implemented yet")
    pass

def main():
    solve()

if __name__ == "__main__":
    main()

# Test cases
def test_examples():
    """TODO: Add test cases"""
    assert True  # Placeholder test
    pass

"""
Problem Analysis:
- Pattern: $PATTERN
- Time Complexity: O(?)
- Space Complexity: O(?)

Approach:
1. [Step 1]
2. [Step 2]
3. [Step 3]

Edge Cases:
- [Edge case 1]
- [Edge case 2]
"""
EOF

# Create notes files
print_info "Creating notes files..."

cat > "$PROBLEM_DIR/educative-notes.md" << EOF
# Educative Notes - $DISPLAY_NAME

## AI Code Mentor Insights
[Record hints and guidance received from AI Code Mentor]

## Visualization Notes
[Describe key visualizations that helped understanding]

## Interactive Learning Points
[What you learned from the interactive coding environment]

## Pattern Application
[How this problem demonstrates the $PATTERN pattern]

## Hints Used
- [Hint 1 and when you used it]
- [Hint 2 and when you used it]

## Alternative Approaches Shown
[Different solutions or optimizations demonstrated]
EOF

cat > "$PROBLEM_DIR/neetcode-notes.md" << EOF
# neetcode.io Notes - $DISPLAY_NAME

## Video Explanation Key Points
[Main insights from video explanation]

## Alternative Approaches
[Different solutions presented in video]

## Code Walkthrough Notes
[Step-by-step explanation notes]

## Common Mistakes Highlighted
[Pitfalls mentioned in the video]

## Follow-up Discussion
[Additional questions or variations discussed]

## Related Problems Mentioned
[Other problems referenced in the video]
EOF

cat > "$PROBLEM_DIR/variations.md" << EOF
# $PROBLEM_NAME - Variations & Extensions

## Common Variations
1. [Variation 1 description]
2. [Variation 2 description]
3. [Variation 3 description]

## Interview Follow-ups
- [Common follow-up question 1]
- [Common follow-up question 2]
- [Common follow-up question 3]

## Difficulty Progressions
### Easier Version
[Simpler version of this problem]

### Harder Version
[More complex version of this problem]

## Real-world Applications
[Where this pattern/problem appears in real systems]

## Related LeetCode Problems
$([ -n "$LEETCODE_NUMBER" ] && echo "- [Original Problem]($LEETCODE_NUMBER)")
- [Related Problem 1](link)
- [Related Problem 2](link)
- [Related Problem 3](link)
EOF

# Update pattern README to include this problem
print_info "Updating pattern README..."

PATTERN_README="$PATTERN_DIR/README.md"
if [ -f "$PATTERN_README" ]; then
    # Check if this problem is already listed
    if ! grep -q "$PROBLEM_NAME" "$PATTERN_README"; then
        # Add to problems solved section
        if grep -q "## Problems Solved" "$PATTERN_README"; then
            # Insert after the "## Problems Solved" line
            sed -i.bak "/## Problems Solved/a\\
- [ ] $PROBLEM_NAME ($DIFFICULTY) - [Link]($PROBLEM_NAME/)" "$PATTERN_README"
            rm "$PATTERN_README.bak" 2>/dev/null || true
            print_status "Added problem to pattern README"
        else
            print_warning "Pattern README exists but doesn't have '## Problems Solved' section"
        fi
    else
        print_info "Problem already listed in pattern README"
    fi
else
    print_warning "Pattern README not found: $PATTERN_README"
    print_info "Consider creating one using: cp templates/pattern-template.md $PATTERN_README"
fi

# Create a quick reference card
print_info "Creating quick reference..."

cat > "$PROBLEM_DIR/quick-ref.md" << EOF
# Quick Reference - $PROBLEM_NAME

## Problem Summary
**Pattern**: $PATTERN
**Difficulty**: $DIFFICULTY
$([ -n "$LEETCODE_NUMBER" ] && echo "**LeetCode**: $LEETCODE_NUMBER")

## Solution Approach
\`\`\`
[Quick algorithm description]
\`\`\`

## Time/Space Complexity
- **Time**: O(?)
- **Space**: O(?)

## Key Code Pattern (Go)
\`\`\`go
// [Key implementation pattern]
\`\`\`

## Key Code Pattern (Rust)
\`\`\`rust
// [Key implementation pattern]
\`\`\`

## Key Code Pattern (Python)
\`\`\`python
# [Key implementation pattern]
\`\`\`

## Interview Tips
- [Tip 1]
- [Tip 2]
- [Tip 3]

## When to Use This Pattern
[Recognition criteria for interviews]
EOF

print_status "Successfully created problem structure for '$PROBLEM_NAME'"
echo ""
print_info "Files created:"
echo "  📁 $PROBLEM_DIR/"
echo "  📄 ├── README.md (main problem documentation)"
echo "  🔧 ├── solution.go (Go implementation)"
echo "  🦀 ├── solution.rs (Rust implementation)"
echo "  🐍 ├── solution.py (Python implementation)"
echo "  📚 ├── educative-notes.md (AI Code Mentor insights)"
echo "  🎥 ├── neetcode-notes.md (video explanation notes)"
echo "  🔄 ├── variations.md (problem variations)"
echo "  ⚡ └── quick-ref.md (quick reference card)"
echo ""
print_info "Next steps:"
echo "  1. Read the problem statement and update README.md"
echo "  2. Implement solution in your preferred language (Go/Rust/Python)"
echo "  3. Add notes as you learn from different resources"
echo "  4. Update progress checklist as you master the problem"
echo ""
print_info "Start working: cd $PROBLEM_DIR && \$EDITOR README.md"