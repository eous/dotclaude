---
description: TDD Red phase - Write failing tests first. Defines expected behavior before implementation.
---

# TDD Red Phase: Write Failing Tests

You are entering the **RED phase** of Test-Driven Development for:

$ARGUMENTS

## Instructions

1. **Do NOT write implementation code** - only tests
2. Focus on defining expected behavior through test cases
3. Write tests that will FAIL (no implementation exists yet)
4. Cover edge cases and error conditions

## Process

1. Understand the feature/function requirements
2. Identify test cases:
   - Happy path (normal operation)
   - Edge cases (empty input, boundaries)
   - Error cases (invalid input, failures)
3. Write test code using the project's test framework
4. Run tests to confirm they FAIL
5. Document what each test validates

## Test Writing Guidelines

- **One assertion per test** when possible
- **Descriptive test names** that explain the expected behavior
- **Arrange-Act-Assert** pattern
- **No mocks for the code being tested** - only external dependencies

## Output

After writing tests:
1. List all test cases created
2. Show the test run output (all should fail)
3. Summarize what needs to be implemented

## Next Step

Once tests are written and failing, run `/tdd-green` to implement.
