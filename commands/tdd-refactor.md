---
description: TDD Refactor phase - Improve code quality while keeping tests green. Clean up without changing behavior.
---

# TDD Refactor Phase: Improve Code Quality

You are entering the **REFACTOR phase** of Test-Driven Development for:

$ARGUMENTS

## Instructions

1. Improve code quality WITHOUT changing behavior
2. Tests must stay GREEN throughout
3. Make small changes, run tests after each
4. Focus on readability, maintainability, performance

## Refactoring Targets

### Code Smells to Address
- Duplicate code
- Long functions/methods
- Poor naming
- Magic numbers/strings
- Deep nesting
- Large classes

### Improvements to Make
- Extract helper functions
- Rename for clarity
- Add type annotations
- Simplify conditionals
- Remove dead code
- Improve error messages

## Process

1. Identify one improvement to make
2. Make the change
3. Run tests - must still pass
4. Commit if tests pass
5. Repeat until satisfied

## Refactoring Guidelines

- **One change at a time** - easier to debug if tests fail
- **Run tests frequently** - after every small change
- **Don't add features** - only improve existing code
- **Keep functions small** - single responsibility
- **Use descriptive names** - code should read like prose

## Quality Checklist

- [ ] All tests still pass
- [ ] No behavior changes
- [ ] Code is more readable
- [ ] Duplication removed
- [ ] Names are clear
- [ ] Functions are focused

## Output

After refactoring:
1. Summarize changes made
2. Show final test run (all passing)
3. Highlight any remaining technical debt

## TDD Cycle Complete

You can now:
- Start a new `/tdd-red` cycle for additional features
- Run `/review` for code review
- Commit your changes
