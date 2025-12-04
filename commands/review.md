---
description: Run code review on recent changes or specified files. Checks for correctness, security, and best practices.
---

# Code Review Phase

You are entering **code review mode** for:

$ARGUMENTS

## Instructions

1. Use the `code-reviewer` agent to analyze the code
2. Check for correctness, security, and best practices
3. Provide actionable feedback with specific fixes
4. Prioritize issues by severity

## Review Scope

If no specific files are provided, review:
- Recently modified files (check git status)
- Files changed since last commit
- Any code written in this session

## Process

1. Identify files to review
2. Invoke code-reviewer agent
3. Present findings organized by severity
4. Suggest specific fixes for issues found

## After Review

- **Critical issues**: Must be fixed before committing
- **Major issues**: Should be addressed
- **Minor issues**: Consider for improvement
- **Positive notes**: Acknowledge good practices

Begin code review now.
