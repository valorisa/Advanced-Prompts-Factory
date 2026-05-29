# Contributing to Advanced Prompts Factory

Thank you for considering contributing to Advanced Prompts Factory! This document outlines the guidelines and process for contributing to this project.

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [How Can I Contribute?](#how-can-i-contribute)
- [Development Setup](#development-setup)
- [Coding Standards](#coding-standards)
- [Commit Message Guidelines](#commit-message-guidelines)
- [Pull Request Process](#pull-request-process)
- [Review Process](#review-process)

---

## Code of Conduct

This project adheres to the [Contributor Covenant Code of Conduct](CODE_OF_CONDUCT.md). By participating, you are expected to uphold this code. Please report unacceptable behavior to [valorisa on GitHub](https://github.com/valorisa).

---

## How Can I Contribute?

### Reporting Bugs

- **Use the bug report template** when creating an issue
- **Search existing issues** to avoid duplicates
- **Provide detailed reproduction steps** including environment details
- **Include actual vs expected behavior** with examples

### Suggesting Enhancements

- **Use the feature request template** when creating an issue
- **Explain the problem** you're trying to solve
- **Describe the solution** you'd like to see
- **Consider alternatives** you've explored

### Contributing New Meta-Prompts

1. **Fork the repository** and create a new branch
2. **Follow the prompt template** structure (see `prompts/repoarchitect-pro.md`)
3. **Test with 3+ different project types** covering different stacks
4. **Document stack support** and project types in the frontmatter
5. **Add to the index** in `docs/prompts-index.md`
6. **Submit a pull request** following the PR guidelines below

### Improving Documentation

- Fix typos, clarify instructions, add examples
- Update outdated information
- Add troubleshooting tips based on real issues
- Translate content (currently EN/FR, other languages welcome)

---

## Development Setup

### Prerequisites

- **Git** 2.30+
- **PowerShell** 7.6+ (for automation scripts on Windows)
- **Node.js** 18+ (for markdown linting)
- **Text Editor** with markdown support (VS Code recommended)

### Initial Setup

```bash
# Clone your fork
git clone https://github.com/YOUR_USERNAME/Advanced-Prompts-Factory.git
cd Advanced-Prompts-Factory

# Add upstream remote
git remote add upstream https://github.com/valorisa/Advanced-Prompts-Factory.git

# Install markdown linting tools
npm install -g markdownlint-cli2

# Load PowerShell automation functions (Windows)
. ./scripts/Make.ps1
```

### Running Validations Locally

```powershell
# Validate markdown files
Invoke-Lint

# Check for broken links
Invoke-LinkCheck

# Validate prompt metadata
Invoke-ValidatePrompts

# Run full test suite
Invoke-Test
```

---

## Coding Standards

### Markdown Files

- **Comply with markdownlint** rules (see `.markdownlint.json`)
- **Use ATX-style headers** (`#` prefix, not underlines)
- **Wrap lines at 120 characters** for better diff readability
- **Use reference-style links** for repeated URLs
- **Include language tags** in code fences (e.g., ` ```bash `)
- **Use GitHub alerts** for callouts: `> [!NOTE]`, `> [!WARNING]`, `> [!TIP]`

### Meta-Prompt Structure

Every new meta-prompt must include:

```markdown
# Prompt Name

**Version**: X.Y.Z
**Stacks Supported**: [comma-separated list]
**Project Types**: [comma-separated list]
**Author**: [GitHub username]
**Last Updated**: YYYY-MM-DD

## Overview
[Brief description of what this prompt generates]

## Usage
[Step-by-step instructions]

## The Meta-Prompt
[The actual prompt content in a code fence]

## What Changed from vX.Y
[Changelog table if updating existing prompt]

## License
[License information]
```

### PowerShell Scripts

- **Use verb-noun naming** (e.g., `Invoke-Lint`, `Test-Markdown`)
- **Include comment-based help** for all functions
- **Use `[CmdletBinding()]`** for advanced parameter support
- **Return objects**, not formatted text
- **Test on PowerShell 7.6+** (Core, not Windows PowerShell 5.1)

---

## Commit Message Guidelines

We follow the [Conventional Commits](https://www.conventionalcommits.org/) specification.

### Format

```text
<type>(<scope>): <subject>

<body>

<footer>
```

### Types

- **feat**: New feature or meta-prompt
- **fix**: Bug fix or correction
- **docs**: Documentation changes only
- **style**: Formatting, markdown linting fixes
- **refactor**: Code/prompt restructuring without behavior change
- **test**: Adding or updating tests/validations
- **chore**: Maintenance tasks, dependency updates

### Examples

```text
feat(prompts): add repoarchitect-pro v2.0 with stack analysis

Introduce silent stack detection phase that adapts generated files
to PowerShell, Node.js, Python, Nix, and Bash environments.

Closes #42
```

```text
docs(readme): clarify installation steps for Windows users

Add PowerShell-specific commands and troubleshooting section
for common Windows environment issues.
```

```text
fix(ci): correct markdownlint config for heading styles

Changed MD003 rule to 'atx' style to match our existing files.
```

### Commit Scope

Common scopes:

- `prompts` - Changes to meta-prompt files
- `docs` - Documentation updates
- `scripts` - Automation script changes
- `ci` - CI/CD workflow modifications
- `deps` - Dependency updates

---

## Pull Request Process

### Before Submitting

1. **Create a feature branch** from `main`:

   ```bash
   git checkout -b feat/my-new-prompt
   ```

2. **Make your changes** following coding standards

3. **Test thoroughly**:

   ```powershell
   Invoke-Test  # Run all validations
   ```

4. **Update documentation** if needed:
   - Add new prompt to `docs/prompts-index.md`
   - Update README.md (EN) or README_FR.md (FR) if adding major features
   - Add usage examples to `docs/usage-examples.md`

5. **Commit with conventional messages**:

   ```bash
   git add .
   git commit -m "feat(prompts): add api-architect meta-prompt"
   ```

6. **Push to your fork**:

   ```bash
   git push origin feat/my-new-prompt
   ```

### Submitting the PR

1. **Go to GitHub** and create a Pull Request from your fork
2. **Use the PR template** (auto-populated)
3. **Fill out all sections**:
   - Description of changes
   - Type of change (feature, fix, docs, etc.)
   - Testing performed
   - Checklist completion

4. **Link related issues** using keywords:
   - `Closes #123` (will auto-close issue when merged)
   - `Relates to #456` (reference without closing)

### PR Title Format

Use the same conventional commit format:

```text
feat(prompts): add api-architect meta-prompt for REST API generation
```

---

## Review Process

### What Reviewers Look For

- **Code Quality**: Markdown linting passes, no broken links
- **Functionality**: Meta-prompts tested with real examples
- **Documentation**: Changes documented, examples provided
- **Standards Compliance**: Conventional commits, proper structure
- **Testing**: Evidence of testing provided

### Review Timeline

- **Initial response**: Within 48 hours
- **Full review**: Within 5 business days
- **Approval**: Requires 1 maintainer approval

### Addressing Review Feedback

1. **Make requested changes** in new commits (don't force-push)
2. **Respond to comments** with explanations or questions
3. **Mark conversations as resolved** once addressed
4. **Request re-review** when ready

### After Approval

- **Squash and merge** is preferred for most PRs
- **Maintainers will merge** after approval (don't merge your own PRs)
- **Delete your branch** after merge (optional)

---

## Additional Resources

- [Conventional Commits](https://www.conventionalcommits.org/)
- [Contributor Covenant](https://www.contributor-covenant.org/)
- [GitHub Flow](https://guides.github.com/introduction/flow/)
- [Markdown Guide](https://www.markdownguide.org/)
- [Keep a Changelog](https://keepachangelog.com/)

---

## Questions?

- **General questions**: Open a [discussion](https://github.com/valorisa/Advanced-Prompts-Factory/discussions)
- **Bug reports**: Use the [bug report template](https://github.com/valorisa/Advanced-Prompts-Factory/issues/new?template=bug_report.md)
- **Feature requests**: Use the [feature request template](https://github.com/valorisa/Advanced-Prompts-Factory/issues/new?template=feature_request.md)

---

Thank you for contributing! 🎉
