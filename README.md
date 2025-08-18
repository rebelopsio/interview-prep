# Interview Preparation Plan

A structured 12-week preparation plan integrating multiple resources with focus on pattern recognition and confidence building. This repository provides organized tracking for coding patterns, problems, and progress across Go, Rust, and Python implementations.

## Quick Start

1. **Bootstrap the repository structure**:
   ```bash
   chmod +x bootstrap.sh
   ./bootstrap.sh
   ```

2. **Add your first problem**:
   ```bash
   chmod +x add-problem.sh
   ./add-problem.sh two-pointers valid-palindrome 125 Easy
   ```

3. **Start coding**:
   ```bash
   cd patterns/two-pointers/valid-palindrome/
   # Edit README.md, then implement in your preferred language
   ```

## Resources Stack

- **📚 Books**: Alex Xu's "Coding Interview Patterns" + "Data Structures the Fun Way"
- **💻 Interactive Learning**: Educative (Grokking courses + AI Code Mentor)
- **🎯 Problem Practice**: neetcode.io
- **🎤 Mock Interviews**: Educative AI + human practice
- **🔧 Languages**: Go, Rust, Python implementations

## Repository Structure

```
interview-prep/
├── README.md                    # This file
├── bootstrap.sh                 # Initialize repository structure
├── add-problem.sh              # Add new problems easily
├── .gitignore                  # Ignore IDE and build files
├── progress/                   # Track your daily progress
│   ├── daily-log.md
│   ├── weekly-reviews/
│   └── mock-interviews/
├── patterns/                   # 25+ coding patterns
│   ├── two-pointers/
│   │   ├── README.md           # Pattern overview
│   │   └── valid-palindrome/   # Individual problems
│   │       ├── README.md       # Problem documentation
│   │       ├── solution.go     # Go implementation
│   │       ├── solution.rs     # Rust implementation
│   │       ├── solution.py     # Python implementation
│   │       ├── educative-notes.md
│   │       └── neetcode-notes.md
│   ├── sliding-window/
│   ├── dynamic-programming/
│   └── [23+ more patterns]/
├── system-design/              # System design practice
│   ├── fundamentals/
│   └── practice-problems/
├── templates/                  # Reusable templates
└── resources/                  # Book notes & course progress
```

## Scripts Usage

### Bootstrap Script (`bootstrap.sh`)
Creates the complete repository structure with templates and example files:

```bash
# Initialize everything
./bootstrap.sh

# What it creates:
# - All 25+ pattern directories
# - Template files for problems and daily logs
# - Progress tracking structure
# - System design sections
# - Example Two Pointers pattern with README
```

### Add Problem Script (`add-problem.sh`)
Quickly add new problems with complete file structure:

```bash
# Basic usage
./add-problem.sh <pattern> <problem-name> [leetcode-number] [difficulty]

# Examples
./add-problem.sh two-pointers 3sum 15 Medium
./add-problem.sh sliding-window longest-substring 3 Medium
./add-problem.sh dynamic-programming coin-change 322

# Creates complete problem structure:
# - README.md (problem documentation)
# - solution.go, solution.rs, solution.py
# - educative-notes.md, neetcode-notes.md
# - variations.md, quick-ref.md
# - Updates pattern README automatically
```

## 12-Week Schedule Overview

### Phase 1: Foundation Building (Weeks 1-4)
**Focus**: Pattern internalization with low pressure
- **Primary Resource**: Educative (40% of time)
- **Daily Structure**: 90min Educative patterns → 60min neetcode.io → 60min book reading
- **Goal**: Master core patterns in interactive environment

### Phase 2: Pattern Application (Weeks 5-8)
**Focus**: Volume practice with pattern reinforcement
- **Primary Resource**: neetcode.io (40% of time)
- **Daily Structure**: 2hr problem solving → 90min Educative advanced → book review
- **Goal**: Build speed and pattern recognition

### Phase 3: Interview Simulation (Weeks 9-12)
**Focus**: Pressure inoculation and performance optimization
- **Primary Resource**: Mock interviews (25% of time)
- **Daily Structure**: Timed practice → targeted weakness work → mock interviews
- **Goal**: Confident performance under pressure

## Multi-Language Implementation Strategy

### Language Progression Approach
1. **Python First**: Rapid prototyping and algorithm understanding
    - Quick to write and test ideas
    - Focus on logic without syntax complexity
    - Ideal for initial pattern learning

2. **Go Second**: Production-ready implementation
    - Your primary work language
    - Practice for real interview scenarios
    - Clean, readable, performant code

3. **Rust Third**: Advanced concepts and optimization
    - Memory safety and performance awareness
    - Demonstrates systems programming knowledge
    - Challenges you to think about edge cases

### When to Use Each Language
- **Learning Phase**: Start with Python for quick understanding
- **Practice Phase**: Implement in Go for interview readiness
- **Mastery Phase**: Challenge yourself with Rust implementation
- **Review Phase**: Compare all three implementations for insights

## Getting Started Workflow

### Day 1: Setup
```bash
# 1. Clone/create repository
git init interview-prep && cd interview-prep

# 2. Bootstrap structure
./bootstrap.sh

# 3. Set up git
git add .
git commit -m "Initial repository setup"
```

### Day 2+: Daily Practice
```bash
# 1. Add new problem (example: Two Pointers pattern)
./add-problem.sh two-pointers container-with-most-water 11 Medium

# 2. Work on the problem
cd patterns/two-pointers/container-with-most-water/
$EDITOR README.md  # Read problem, plan approach

# 3. Implement solution(s)
$EDITOR solution.py  # Start with Python
$EDITOR solution.go  # Implement in Go
$EDITOR solution.rs  # Challenge with Rust

# 4. Add learning notes
$EDITOR educative-notes.md   # AI Code Mentor insights
$EDITOR neetcode-notes.md    # Video explanation notes

# 5. Update progress
$EDITOR ../../README.md      # Check off completed problem
$EDITOR ../../../progress/daily-log.md  # Log daily progress
```

## Daily Time Allocation (6 hours)

- **40%** Active problem-solving (2.4 hours)
- **30%** Pattern learning via Educative (1.8 hours)
- **20%** Book study (1.2 hours)
- **10%** Review/mock interviews (0.6 hours)

## Weekly Schedule Template

| Day | Focus | Morning (2.5h) | Afternoon (2h) | Evening (1.5h) |
|-----|-------|----------------|----------------|----------------|
| **Mon/Thu** | Pattern Learning | New Educative patterns | Xu's book chapters | neetcode.io variations |
| **Tue/Fri** | Problem Practice | neetcode.io mixed | Educative with AI hints | Solution review |
| **Wed** | System Design | Xu's system design | Educative system design | Design practice |
| **Sat** | Mock Interviews | Mock interview | Performance analysis | Weakness targeting |
| **Sun** | Review & Rest | Spaced repetition | Planning | Rest (2h) |

## Key Educative Courses

1. **Grokking the Coding Interview Patterns** (85 hours, 28+ patterns, 500+ problems)
2. **Grokking Dynamic Programming** (Advanced DP patterns with visualization)
3. **Grokking the System Design Interview** (RESHADED framework practice)

## Confidence Building Strategy

### Graduated Exposure (Weeks 1-12)
- **Weeks 1-3**: Private practice on Educative only
- **Week 4**: Add verbal explanation while coding
- **Week 5**: Record yourself solving problems
- **Weeks 6-8**: Educative AI mock interviews + peer practice
- **Weeks 9-12**: Human mock interviews alternating with AI practice

### AI Code Mentor Usage
- Start with liberal AI assistance
- Gradually reduce reliance as confidence builds
- Use for judgment-free guidance during difficult problems
- Practice visualization recall from memory

## Progress Tracking

### Daily Metrics
- [ ] Problems solved (with difficulty rating)
- [ ] Patterns practiced
- [ ] Languages used (Python/Go/Rust)
- [ ] Time per activity
- [ ] Confidence level (1-5 scale)
- [ ] AI hints used

### Weekly Goals
- [ ] 80% pattern recognition accuracy before advancing
- [ ] Complete assigned problems/chapters
- [ ] Implement problems in at least 2 languages
- [ ] One mock interview minimum
- [ ] Identify and target 2-3 weak patterns

### Assessment Schedule
- **Tuesdays & Fridays**: Take Educative assessments (track improvement)
- **Weekly**: Review progress spreadsheet
- **Bi-weekly**: Adjust focus based on weak areas

## Resource Usage Strategy

### When to Use Each Resource
- **Educative**: Initial pattern learning, interactive practice, confidence building
- **neetcode.io**: Volume practice, video explanations when stuck
- **Books**: Deep conceptual understanding, reference material
- **Mock Interviews**: Pressure simulation, performance feedback

### Avoiding Overwhelm
- **Primary Resource Rule**: One resource gets 40% of weekly time
- **Time-boxing**: Never more than 2 resources per 90-minute block
- **No Resource Switching**: When stuck, use hints/AI instead of jumping platforms

## Success Metrics

### Technical Readiness
- [ ] Recognize patterns in 80% of medium problems within 2 minutes
- [ ] Implement solutions for known patterns within time limits
- [ ] Can implement same solution in multiple languages
- [ ] Explain approach clearly while coding

### Confidence Indicators
- [ ] Comfortable with AI-assisted practice
- [ ] Can verbalize thought process under observation
- [ ] Performance improves rather than degrades in mock interviews
- [ ] Language choice doesn't affect problem-solving ability
- [ ] Anxiety manageable during timed practice

## Emergency Protocols

### When Stuck on Problems
1. Use Educative AI Code Mentor for hints
2. Review pattern in Alex Xu's book
3. Watch neetcode.io explanation
4. Try implementing in a different language
5. Practice similar problems until pattern clicks

### When Feeling Overwhelmed
1. Reduce to single resource for the day
2. Focus on previously mastered patterns
3. Use Educative's private environment only
4. Implement in your most comfortable language first
5. Take planned rest day if needed

### When Switching Languages Feels Hard
1. Start with Python for algorithm clarity
2. Convert working Python solution to Go/Rust
3. Focus on one language per week initially
4. Use language-specific templates as reference

---

## Repository Maintenance

### Adding New Patterns
If you discover new patterns not covered:

```bash
# 1. Create pattern directory
mkdir patterns/new-pattern-name

# 2. Create pattern README
cp templates/pattern-template.md patterns/new-pattern-name/README.md

# 3. Edit pattern details
$EDITOR patterns/new-pattern-name/README.md
```

### Backing Up Progress
```bash
# Regular git commits
git add progress/
git commit -m "Week X progress update"

# Tag major milestones
git tag -a week-4-complete -m "Foundation phase complete"
```

### Sharing Solutions
- Keep personal notes in `progress/personal/` (gitignored)
- Share pattern implementations and insights
- Document alternative approaches learned from others

---

*Remember: This is a marathon, not a sprint. Consistent daily progress beats sporadic intense sessions. The multi-language approach builds deeper understanding and demonstrates versatility to interviewers.*