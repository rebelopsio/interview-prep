# Intersection of Two Linked Lists

**Difficulty**: Easy
**Pattern**: fast-slow-pointers
**LeetCode**: 160
**Neetcode**: [Intersection of Two Linked Lists](https://neetcode.io/problems/intersection-of-two-linked-lists)
**Educative**:

## Problem Statement
Given the heads of two singly linked-lists headA and headB, return the node at which the two lists intersect. If the two linked lists have no intersection at all, return null.

## Approach
Ok, this one was tricky and I don't think the solution matches the pattern.
- Since we have two link lists of varying length, we are going to traverse each list, with their own pointers, and when we reach the end of each, we'll start at the head of the second list.
- This allows us to create two even length lists as each will be len(m) + len(n) in length.

## Key Insights
- [What you learned]
- [Gotchas to remember]
- [Pattern recognition clues]

## Complexity
- **Time**: O(m + n)
- **Space**: O(1)

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
