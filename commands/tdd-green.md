---
description: TDD Green phase - Write minimal code to make tests pass. Focus on correctness, not elegance.
---

# TDD Green Phase: Make Tests Pass

You are entering the **GREEN phase** of Test-Driven Development for:

$ARGUMENTS

## Instructions

1. Write the **minimum code** needed to pass the failing tests
2. Do NOT add extra features or optimizations
3. Do NOT refactor yet - that comes in the refactor phase
4. Focus purely on making tests pass

## Process

1. Review the failing tests from the RED phase
2. Implement just enough code to pass the first test
3. Run tests - confirm first test passes
4. Repeat for each failing test
5. Continue until ALL tests pass

## Implementation Guidelines

- **Simplest solution first** - even if ugly
- **No premature optimization**
- **No additional functionality** beyond what tests require
- **It's okay to hardcode** if that makes a test pass (refactor later)

## Quality Checklist

- [ ] All tests pass
- [ ] No test was modified to make it pass
- [ ] Implementation matches test expectations exactly
- [ ] No extra code beyond what tests require

## Output

After implementation:
1. Show the implementation code
2. Show test run output (all should pass)
3. Note any code that needs refactoring

## Next Step

Once all tests pass, run `/tdd-refactor` to improve the code.
