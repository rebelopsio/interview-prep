# Merge Intervals Pattern

## When to Use
- Problems involving overlapping intervals or ranges
- Need to merge, insert, or remove intervals
- Scheduling problems with time slots or appointments
- Problems involving ranges on a number line
- Conflict detection between intervals

## Key Insights
- Sort intervals by start time to process them in order
- Compare current interval with previous to detect overlaps
- Two intervals overlap if start of one is less than or equal to end of other
- Merge overlapping intervals by taking min start and max end
- Keep track of merged intervals as you process

## Common Variations
- **Merge Overlapping Intervals**: Combine all overlapping intervals
- **Insert Interval**: Insert new interval and merge if necessary
- **Interval Intersection**: Find intersection of two interval lists
- **Non-overlapping Intervals**: Remove minimum intervals to make non-overlapping
- **Meeting Rooms**: Determine if all meetings can be attended

## Implementation Notes
### Python Specific
```python
# Basic interval merging
def merge_intervals(intervals):
    if len(intervals) < 2:
        return intervals

    # Sort by start time
    intervals.sort(key=lambda x: x[0])

    merged = [intervals[0]]

    for current in intervals[1:]:
        last_merged = merged[-1]

        # Check if intervals overlap
        if current[0] <= last_merged[1]:
            # Merge intervals
            last_merged[1] = max(last_merged[1], current[1])
        else:
            # No overlap, add current interval
            merged.append(current)

    return merged

# Insert interval and merge
def insert_interval(intervals, new_interval):
    result = []
    i = 0

    # Add all intervals that end before new interval starts
    while i < len(intervals) and intervals[i][1] < new_interval[0]:
        result.append(intervals[i])
        i += 1

    # Merge overlapping intervals
    while i < len(intervals) and intervals[i][0] <= new_interval[1]:
        new_interval[0] = min(new_interval[0], intervals[i][0])
        new_interval[1] = max(new_interval[1], intervals[i][1])
        i += 1

    result.append(new_interval)

    # Add remaining intervals
    while i < len(intervals):
        result.append(intervals[i])
        i += 1

    return result
```

### Go Specific
```go
import "sort"

// Interval struct
type Interval struct {
    Start int
    End   int
}

// Merge overlapping intervals
func mergeIntervals(intervals []Interval) []Interval {
    if len(intervals) < 2 {
        return intervals
    }

    // Sort by start time
    sort.Slice(intervals, func(i, j int) bool {
        return intervals[i].Start < intervals[j].Start
    })

    merged := []Interval{intervals[0]}

    for i := 1; i < len(intervals); i++ {
        current := intervals[i]
        lastMerged := &merged[len(merged)-1]

        // Check if intervals overlap
        if current.Start <= lastMerged.End {
            // Merge intervals
            if current.End > lastMerged.End {
                lastMerged.End = current.End
            }
        } else {
            // No overlap, add current interval
            merged = append(merged, current)
        }
    }

    return merged
}

// Check if intervals intersect
func intersect(intervals1, intervals2 []Interval) []Interval {
    result := []Interval{}
    i, j := 0, 0

    for i < len(intervals1) && j < len(intervals2) {
        start := max(intervals1[i].Start, intervals2[j].Start)
        end := min(intervals1[i].End, intervals2[j].End)

        if start <= end {
            result = append(result, Interval{start, end})
        }

        // Move pointer of interval that ends first
        if intervals1[i].End < intervals2[j].End {
            i++
        } else {
            j++
        }
    }

    return result
}
```

### Rust Specific
```rust
#[derive(Debug, Clone)]
struct Interval {
    start: i32,
    end: i32,
}

// Merge overlapping intervals
fn merge_intervals(mut intervals: Vec<Interval>) -> Vec<Interval> {
    if intervals.len() < 2 {
        return intervals;
    }

    // Sort by start time
    intervals.sort_by(|a, b| a.start.cmp(&b.start));

    let mut merged = vec![intervals[0].clone()];

    for current in intervals.into_iter().skip(1) {
        let last_merged = merged.last_mut().unwrap();

        // Check if intervals overlap
        if current.start <= last_merged.end {
            // Merge intervals
            last_merged.end = last_merged.end.max(current.end);
        } else {
            // No overlap, add current interval
            merged.push(current);
        }
    }

    merged
}

// Insert interval and merge
fn insert_interval(intervals: Vec<Interval>, new_interval: Interval) -> Vec<Interval> {
    let mut result = Vec::new();
    let mut new_interval = new_interval;
    let mut i = 0;

    // Add intervals that end before new interval starts
    while i < intervals.len() && intervals[i].end < new_interval.start {
        result.push(intervals[i].clone());
        i += 1;
    }

    // Merge overlapping intervals
    while i < intervals.len() && intervals[i].start <= new_interval.end {
        new_interval.start = new_interval.start.min(intervals[i].start);
        new_interval.end = new_interval.end.max(intervals[i].end);
        i += 1;
    }

    result.push(new_interval);

    // Add remaining intervals
    while i < intervals.len() {
        result.push(intervals[i].clone());
        i += 1;
    }

    result
}
```

## Time/Space Complexity
- **Time**: O(n log n) due to sorting, O(n) for merging process
- **Space**: O(n) for storing merged intervals, O(1) if modifying in-place

## Problems Solved
- [ ] Problem 1 (Medium) - [Link to folder]
- [ ] Problem 2 (Medium) - [Link to folder]
- [ ] Problem 3 (Hard) - [Link to folder]

## Resources
- **Educative**: Grokking Coding Interview - Merge Intervals
- **Book Reference**: Algorithm design and analysis
- **neetcode.io**: Intervals playlist
