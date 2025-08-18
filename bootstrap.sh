#!/bin/bash

# FAANG Interview Prep Repository Bootstrap Script
# Creates the complete directory structure with templates and .gitkeep files

set -e  # Exit on any error

echo "🚀 Bootstrapping FAANG Interview Prep Repository..."

# Create main directory structure
echo "📁 Creating directory structure..."

# Progress tracking directories
mkdir -p progress/{weekly-reviews,mock-interviews,assessments}

# Pattern directories (based on Grokking the Coding Interview patterns)
patterns=(
    "two-pointers"
    "sliding-window"
    "fast-slow-pointers"
    "merge-intervals"
    "cyclic-sort"
    "in-place-reversal-linked-list"
    "tree-breadth-first-search"
    "tree-depth-first-search"
    "two-heaps"
    "subsets"
    "modified-binary-search"
    "bitwise-xor"
    "top-k-elements"
    "k-way-merge"
    "0-1-knapsack"
    "unbounded-knapsack"
    "fibonacci-numbers"
    "palindromic-subsequence"
    "longest-common-substring"
    "topological-sort"
    "backtracking"
    "trie"
    "union-find"
    "ordered-set"
    "multi-threaded"
)

for pattern in "${patterns[@]}"; do
    mkdir -p "patterns/$pattern"
done

# Dynamic Programming sub-patterns
mkdir -p patterns/dynamic-programming/{0-1-knapsack,unbounded-knapsack,fibonacci-numbers,longest-common-subsequence,palindromic-subsequence}

# System Design directories
mkdir -p system-design/{fundamentals,practice-problems/{design-twitter,design-uber,design-chat-system,design-url-shortener,design-notification-system}}

# Templates and resources
mkdir -p templates
mkdir -p resources/{books,educative,neetcode}

echo "📝 Creating template files..."

# Main README (already created in previous artifact - referencing it)
if [ ! -f "README.md" ]; then
    cat > README.md << 'EOF'
# FAANG Interview Preparation Plan

A structured 12-week preparation plan integrating multiple resources with focus on pattern recognition and confidence building.

## Quick Start

1. Review the [preparation plan](README.md)
2. Start with `patterns/two-pointers/`
3. Use templates in `templates/` for new problems
4. Track progress in `progress/daily-log.md`

## Resources

- 📚 Books: Alex Xu's "Coding Interview Patterns" + "Data Structures the Fun Way"
- 💻 Interactive: Educative Grokking courses
- 🎯 Practice: neetcode.io
- 🎤 Interviews: Mock practice

See full plan details in the main README.
EOF
fi

# Pattern README template
cat > templates/pattern-template.md << 'EOF'
# [Pattern Name]

## When to Use
- [Conditions that indicate this pattern]

## Key Insights
- [Core concepts and strategies]

## Common Variations
- [Different ways the pattern appears]

## Implementation Notes
### Go Specific
- [Go-specific tips and patterns]

### Rust Specific
- [Rust-specific tips and patterns]

## Time/Space Complexity
- [Typical complexities for this pattern]

## Problems Solved
- [ ] Problem 1 (Easy) - [Link to folder]
- [ ] Problem 2 (Medium) - [Link to folder]
- [ ] Problem 3 (Hard) - [Link to folder]

## Resources
- **Educative**: [Link to relevant course section]
- **Book Reference**: [Alex Xu chapter/section]
- **neetcode.io**: [Playlist or relevant problems]
EOF

# Problem README template
cat > templates/problem-template.md << 'EOF'
# [Problem Name]

**Difficulty**: Easy/Medium/Hard
**Pattern**: [Primary Pattern]
**LeetCode**: [Problem Number]
**Educative**: [Course/Problem Reference]

## Problem Statement
[Brief description or link]

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

# Daily log template
cat > templates/daily-log-template.md << 'EOF'
# Daily Log - [DATE]

## Goals for Today
- [ ] [Specific goal 1]
- [ ] [Specific goal 2]
- [ ] [Specific goal 3]

## Time Allocation
- **Pattern Learning** (Target: 1.8h): [Actual time]
- **Problem Solving** (Target: 2.4h): [Actual time]
- **Book Reading** (Target: 1.2h): [Actual time]
- **Review/Mock** (Target: 0.6h): [Actual time]

## Problems Solved
| Problem | Pattern | Difficulty | Time Taken | AI Hints Used | Confidence (1-5) |
|---------|---------|------------|------------|---------------|------------------|
| | | | | | |

## Patterns Practiced
- [Pattern 1]: [Problems solved, insights gained]
- [Pattern 2]: [Problems solved, insights gained]

## Key Learnings
- [Important insight 1]
- [Important insight 2]
- [Mistake to avoid]

## Confidence Level Today
**Overall**: [1-5 scale]
**Under Pressure**: [1-5 scale]
**Pattern Recognition**: [1-5 scale]

## Tomorrow's Focus
- [Specific areas to work on]
- [Problems to attempt]
- [Patterns to review]

## Notes
[Any additional thoughts, struggles, breakthroughs]
EOF

# Weekly review template
cat > templates/weekly-review-template.md << 'EOF'
# Weekly Review - Week [X] ([Start Date] - [End Date])

## This Week's Goals vs Achievements
### Goals Set
- [ ] [Goal 1]
- [ ] [Goal 2]
- [ ] [Goal 3]

### Actual Achievements
- [Achievement 1]
- [Achievement 2]
- [Achievement 3]

## Statistics
- **Total Study Time**: [Hours]
- **Problems Solved**: [Count]
- **New Patterns Learned**: [Count]
- **Mock Interviews**: [Count]

## Pattern Mastery Progress
| Pattern | Problems Solved | Confidence (1-5) | Next Steps |
|---------|-----------------|------------------|------------|
| | | | |

## Strengths This Week
- [What went well]
- [Patterns mastered]
- [Confidence improvements]

## Areas for Improvement
- [What struggled with]
- [Patterns need more work]
- [Time management issues]

## Mock Interview Feedback
- [Performance summary]
- [Areas identified for improvement]
- [Confidence under pressure]

## Adjustments for Next Week
- [Schedule changes needed]
- [Focus area shifts]
- [Resource allocation changes]

## Overall Confidence Trend
**Week [X-1]**: [1-5] → **Week [X]**: [1-5]

## Notes
[Additional insights, breakthroughs, concerns]
EOF

echo "📋 Creating initial progress files..."

# Initial daily log
cat > progress/daily-log.md << EOF
# Daily Progress Log

## Current Week: [Update with current week]
## Phase: [Foundation Building / Pattern Application / Interview Simulation]

---

$(cat templates/daily-log-template.md | sed 's/\[DATE\]/'"$(date +%Y-%m-%d)"'/')

---

## Previous Days
[Add previous daily logs here]
EOF

# Course progress tracker
cat > resources/educative/course-progress.md << 'EOF'
# Educative Course Progress

## Grokking the Coding Interview Patterns
- **Progress**: 0% (0/85 hours)
- **Current Section**: [Section name]
- **Patterns Completed**: 0/28+

### Pattern Completion Checklist
- [ ] Two Pointers
- [ ] Sliding Window
- [ ] Fast & Slow Pointers
- [ ] Merge Intervals
- [ ] Cyclic Sort
- [ ] In-place Reversal of LinkedList
- [ ] Tree BFS
- [ ] Tree DFS
- [ ] Two Heaps
- [ ] Subsets
- [ ] Modified Binary Search
- [ ] Bitwise XOR
- [ ] Top 'K' Elements
- [ ] K-way Merge
- [ ] 0/1 Knapsack
- [ ] Unbounded Knapsack
- [ ] Fibonacci Numbers
- [ ] Palindromic Subsequence
- [ ] Longest Common Substring

## Grokking Dynamic Programming
- **Progress**: 0%
- **Current Section**: [Section name]

## Grokking System Design
- **Progress**: 0%
- **Framework Practice**: [ ] RESHADED methodology

## AI Code Mentor Usage
- **Total Hints Used**: 0
- **Dependency Trend**: [Decreasing/Same/Increasing]
- **Most Helpful For**: [Pattern types where AI helps most]
EOF

# neetcode progress
cat > resources/neetcode/video-notes.md << 'EOF'
# neetcode.io Progress & Notes

## Problem Categories Completed
- [ ] Arrays & Hashing (0/X)
- [ ] Two Pointers (0/X)
- [ ] Sliding Window (0/X)
- [ ] Stack (0/X)
- [ ] Binary Search (0/X)
- [ ] Linked List (0/X)
- [ ] Trees (0/X)
- [ ] Tries (0/X)
- [ ] Heap / Priority Queue (0/X)
- [ ] Backtracking (0/X)
- [ ] Graphs (0/X)
- [ ] Advanced Graphs (0/X)
- [ ] 1-D Dynamic Programming (0/X)
- [ ] 2-D Dynamic Programming (0/X)
- [ ] Greedy (0/X)
- [ ] Intervals (0/X)
- [ ] Math & Geometry (0/X)
- [ ] Bit Manipulation (0/X)

## Key Video Insights
[Add notes from helpful explanations]

## Alternative Approaches Learned
[Document different solution approaches from videos]
EOF

# Book notes
cat > resources/books/xu-coding-patterns-notes.md << 'EOF'
# Alex Xu - Coding Interview Patterns - Notes

## Patterns Overview
[Chapter summaries and key insights]

## Pattern Deep Dives
### [Pattern Name]
- **Key Concept**: [Main idea]
- **When to Use**: [Recognition criteria]
- **Implementation**: [Key code patterns]
- **Gotchas**: [Common mistakes]

## Cross-References
[Map book patterns to Educative course sections]
EOF

cat > resources/books/kubica-data-structures-notes.md << 'EOF'
# Data Structures the Fun Way - Notes

## Key Data Structures
[Summaries with memorable analogies from the book]

## Implementation Notes
[How concepts translate to Go/Rust]

## Interview Applications
[How book concepts apply to coding interview problems]
EOF

# System design fundamentals
fundamentals=("load-balancers" "databases" "caching" "microservices" "message-queues" "cdn" "consistency" "availability")

for fundamental in "${fundamentals[@]}"; do
    cat > "system-design/fundamentals/$fundamental.md" << EOF
# $fundamental

## Overview
[Brief description]

## Key Concepts
- [Concept 1]
- [Concept 2]

## Trade-offs
[Important trade-offs to understand]

## Interview Applications
[How this comes up in system design interviews]

## Implementation Examples
[Real-world examples and use cases]

## Resources
- **Book Reference**: [Alex Xu chapter/section]
- **Educative**: [Course section]
EOF
done

# System design framework
cat > system-design/educative-framework.md << 'EOF'
# RESHADED Framework (Educative)

## R - Requirements
- [ ] Functional requirements
- [ ] Non-functional requirements
- [ ] Scale estimates

## E - Estimation
- [ ] Users/requests per second
- [ ] Storage requirements
- [ ] Bandwidth requirements

## S - System Interface
- [ ] API design
- [ ] Input/output formats

## H - High-level Design
- [ ] Major components
- [ ] Data flow

## A - Algorithm & Data Structures
- [ ] Core algorithms needed
- [ ] Data structures

## D - Detailed Design
- [ ] Component deep-dives
- [ ] Database schema

## E - Evaluation
- [ ] Bottlenecks
- [ ] Trade-offs
- [ ] Monitoring

## D - Discussion
- [ ] Follow-up questions
- [ ] Scaling considerations
EOF

echo "🏷️  Adding .gitkeep files to empty directories..."

# Find all empty directories and add .gitkeep
find . -type d -empty -exec touch {}/.gitkeep \;

# Also add .gitkeep to directories that will be populated later
directories_for_gitkeep=(
    "progress/weekly-reviews"
    "progress/mock-interviews"
    "progress/assessments"
    "system-design/practice-problems/design-twitter"
    "system-design/practice-problems/design-uber"
    "system-design/practice-problems/design-chat-system"
    "system-design/practice-problems/design-url-shortener"
    "system-design/practice-problems/design-notification-system"
    "patterns/dynamic-programming/0-1-knapsack"
    "patterns/dynamic-programming/unbounded-knapsack"
    "patterns/dynamic-programming/fibonacci-numbers"
    "patterns/dynamic-programming/longest-common-subsequence"
    "patterns/dynamic-programming/palindromic-subsequence"
)

for dir in "${directories_for_gitkeep[@]}"; do
    if [ -d "$dir" ] && [ -z "$(ls -A "$dir" 2>/dev/null)" ]; then
        touch "$dir/.gitkeep"
    fi
done

echo "📚 Creating initial pattern READMEs for main patterns..."

# Create README for two-pointers as example
cat > patterns/two-pointers/README.md << 'EOF'
# Two Pointers Pattern

## When to Use
- Array/string problems requiring comparison of elements
- Need to find pairs or triplets with specific relationships
- Looking for palindromes or symmetric properties
- Need to remove duplicates in sorted array
- Partitioning problems

## Key Insights
- Use when brute force would be O(n²) but can be optimized to O(n)
- Start pointers at different positions (beginning/end, or slow/fast)
- Move pointers based on comparison logic
- Often used with sorted arrays/strings

## Common Variations
- **Opposite Direction**: Start from both ends, move toward center
- **Same Direction**: Both pointers start from beginning (fast/slow)
- **Multiple Arrays**: Pointers in different arrays

## Implementation Notes
### Go Specific
```go
// Typical pattern
left, right := 0, len(arr)-1
for left < right {
    // Logic here
    if condition {
        left++
    } else {
        right--
    }
}
```

### Rust Specific
```rust
// Typical pattern
let mut left = 0;
let mut right = arr.len() - 1;
while left < right {
    // Logic here
    match condition {
        true => left += 1,
        false => right -= 1,
    }
}
```

## Time/Space Complexity
- **Time**: Usually O(n)
- **Space**: O(1) - only using two pointers

## Problems Solved
- [ ] Valid Palindrome (Easy)
- [ ] Two Sum II (Easy)
- [ ] 3Sum (Medium)
- [ ] Container With Most Water (Medium)
- [ ] Remove Duplicates from Sorted Array (Easy)

## Resources
- **Educative**: Grokking Coding Interview - Two Pointers
- **Book Reference**: Alex Xu Chapter [X]
- **neetcode.io**: Two Pointers playlist
EOF

# Create git repository if not already initialized
if [ ! -d ".git" ]; then
    echo "🔧 Initializing git repository..."
    git init
    echo "# FAANG Interview Prep Repository

Bootstrapped $(date)" > .git-bootstrap-info
fi

echo "✅ Repository structure created successfully!"
echo ""
echo "📁 Directory structure:"
echo "├── patterns/ (${#patterns[@]} coding patterns)"
echo "├── system-design/ (fundamentals + practice problems)"
echo "├── progress/ (daily logs, reviews, assessments)"
echo "├── templates/ (reusable templates)"
echo "└── resources/ (book notes, course progress)"
echo ""
echo "🚀 Next steps:"
echo "1. Review the main README.md for your 12-week plan"
echo "2. Start with 'patterns/two-pointers/' example"
echo "3. Use templates/ for new problems and daily logs"
echo "4. Track progress in progress/daily-log.md"
echo ""
echo "💡 Tip: Copy templates when creating new problems:"
echo "   cp templates/problem-template.md patterns/two-pointers/new-problem/README.md"
