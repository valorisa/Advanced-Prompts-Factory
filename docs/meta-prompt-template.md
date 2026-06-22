# Meta-Prompt Template

**Purpose**: Standardized template for creating new meta-prompts in Advanced Prompts Factory.

**Last Updated**: 2026-05-30

---

## Template Structure

All meta-prompts in this collection follow this canonical structure:

### 1. Frontmatter Section

```markdown
# [Prompt Name]

**Version**: X.Y.Z
**Stacks Supported**: [Stack1, Stack2, ...]
**Project Types**: [Type1, Type2, ...]
**Author**: [GitHub username]
**Last Updated**: YYYY-MM-DD

---
```

**Rules**:

- Version follows [Semantic Versioning](https://semver.org/)
- Stacks: comma-separated, prioritize most tested first
- Project Types: 3-6 concrete use cases
- Author: GitHub username (not real name)
- Date format: ISO 8601 (YYYY-MM-DD)

---

### 2. Overview Section

```markdown
## Overview

[Prompt Name] is [classification]-grade meta-prompt for [core capability].
It produces [quantified output] with **[key innovation]**.

**Key Innovation**: [1-2 sentence description of unique approach]

---
```

**Rules**:

- Classification: `enterprise-grade`, `production-ready`, `experimental`, `specialized`
- Core capability: verb phrase (e.g., "generating REST APIs", "auditing security")
- Quantified output: number of files, artifacts, or deliverables
- Key innovation: what makes THIS prompt different (Phase 0 analysis, zero placeholders, etc.)

**Example**:

> RepoArchitect Pro is an enterprise-grade meta-prompt for generating complete GitHub repositories in a single step. It produces 15+ files with **zero placeholders**, real executable code, and bilingual EN/FR documentation.
>
> **Key Innovation**: Silent Stack Analysis (Phase 0) detects your technology stack and project type before generation, ensuring every file contains real, functional content tailored to your specific environment.

---

### 3. Usage Section

```markdown
## Usage

1. Copy this entire file
2. Paste into your LLM ([recommended models])
3. [Input format]:
   - ✅ [Good example 1]
   - ✅ [Good example 2]
   - ✅ [Good example 3]
4. [Expected outcome]

---
```

**Rules**:

- Recommended models: minimum capability threshold (e.g., "Claude 3.5+, GPT-4")
- Input format: 3+ concrete examples with ✅ checkmarks
- Expected outcome: time estimate + what user receives

**Example**:

> 1. Describe your project in one sentence:
>    - ✅ "PowerShell CLI tool for parsing IIS logs"
>    - ✅ "Python FastAPI backend for a task management system"
>    - ✅ "Node.js library for markdown parsing with TypeScript"
> 2. Receive complete project instantly

---

### 4. The Meta-Prompt Section

```markdown
## The Meta-Prompt

Structure within the meta-prompt:
# Rôle
[Define LLM persona]

# Mission
[Core objective in one paragraph]

# Phase 0: [Analysis/Detection] (Silencieuse, avant génération)
[Pre-generation logic - stack detection, context analysis, etc.]

# Processus de Génération (Exécution Immédiate)
[Main generation workflow]

## 📦 [Deliverables Section Title]
[List all generated artifacts with concrete specs]

# Instructions de Génération
[Execution rules, constraints, style guidelines]

# Checklist de Qualité
[Validation checklist split by category]
```

---

**Rules**:

- **Use triple-backtick code fence** with `markdown` language tag
- **Prompt must be in French** (consistency with RepoArchitect Pro)
- **Sections**:
  - `Rôle`: 1-2 sentences defining LLM persona
  - `Mission`: 1 paragraph, UPPERCASE keywords (UNE SEULE ÉTAPE, RÉEL, FONCTIONNEL)
  - `Phase 0`: Pre-generation analysis/detection logic (if applicable)
  - `Processus de Génération`: Step-by-step workflow
  - Deliverables list: Minimum 10 items with concrete specs
  - `Instructions de Génération`: Numbered list of execution rules (7-10 items)
  - `Checklist de Qualité`: Task-list format split by logical categories

**Checklist Structure**:

```markdown
# Checklist de Qualité

**[Category 1]**
- [ ] [Criterion 1]
- [ ] [Criterion 2]

**[Category 2]**
- [ ] [Criterion 3]
- [ ] [Criterion 4]
```

---

### 5. Real-World Test Results Section

```markdown
## Real-World Test Results

**Test Case: [Descriptive title]**

*Input*: "[Exact prompt given to LLM]"

*Output*: [Quantified deliverables]

- ✅ [Verification point 1]
- ✅ [Verification point 2]
- ✅ [Verification point 3]
[Minimum 5 verification points]

*Repository*: [link-text](https://github.com/user/repo)

---
```

**Rules**:

- Include at least ONE real test case
- Input: verbatim prompt text (in quotes)
- Output: quantified (number of files, lines of code, generation time)
- Verification points: use ✅ emoji + concrete metrics
- Repository link: REQUIRED (proves prompt was tested)

---

### 6. Version History Section

```markdown
## Version History

### vX.Y.Z (YYYY-MM-DD)

[Brief description of changes]

- [Change 1]
- [Change 2]

[Optional comparison table if major version]

---
```

**Rules**:

- Start with most recent version (reverse chronological)
- Breaking changes: bold `**Breaking Change**:` prefix
- Comparison table: use ONLY for major versions (X.0.0)
- Table columns: `Zone`, `v(X-1).Y`, `vX.Y`

**Example**:

```markdown
### v2.0.0 (2026-05-29)

Initial release with Phase 0 stack analysis

| Zone | v1.0 | v2.0 |
|------|------|------|
| Stack Analysis | Mentioned, not tooled | Explicit stack → content matrix |
| CI/CD | Placeholders `[Setup steps]` | Real actions per stack |
```

---

### 7. License Section

```markdown
## License

[License name] - [One-line description].
```

**Rules**:

- Default: `MIT License - Free to use, modify, and distribute.`
- If different: justify in CONTRIBUTING.md

---

## Naming Conventions

### File Names

- Format: `kebab-case.md`
- Location: `prompts/[prompt-name].md`
- Examples: `repoarchitect-pro.md`, `api-architect.md`, `cli-builder.md`

### Prompt Names

- Format: `PascalCase` with optional suffix
- Suffix patterns:
  - `Pro` — comprehensive, enterprise-grade
  - `Lite` — simplified, faster variant
  - `[Stack]` — specialized for one stack (e.g., `PythonAPI`, `NodeCLI`)
- Examples: `RepoArchitect Pro`, `API Architect`, `CLI Builder Lite`

---

## Content Guidelines

### Tone & Style

- **Authoritative but accessible**: Technical precision without jargon walls
- **Action-oriented**: Use imperatives (Générer, Créer, Livrer)
- **Quantified promises**: "15+ files", "zero placeholders", "90 seconds"
- **Emoji usage**:
  - Section headers: ✅ (📦, 🚀, ✨)
  - List items: ✅ for examples, ⚡ for features
  - Avoid: excessive or decorative-only emojis

### Language

- **Meta-prompt content**: French (for LLM instructions)
- **Wrapper documentation**: English (for human readers)
- **Mixed sections**: Use clearly delimited blocks

**Example**:

```markdown
## Usage

1. Copy this entire file
2. Paste into Claude
3. Input: [English example]

## The Meta-Prompt

````markdown
# Rôle
Tu es "RepoArchitect Pro"...
[French content for LLM]
````

```text

### Placeholders

**Forbidden in deliverables**:

- `[TODO]`, `[Your content here]`, `[To be implemented]`
- Generic examples that don't match the stack
- Commented-out code without explanation

**Allowed in templates**:

- `[Prompt Name]`, `[Stack1, Stack2]` — meta-level documentation
- `[user/repo]` — GitHub URL format examples

---

## Stack Support Matrix

When adding stack support, document these dimensions:

| Dimension | Examples |
|-----------|----------|
| Package Manager | npm, pip, cargo, go mod, composer |
| Linter | eslint, pylint, shellcheck, clippy |
| Test Runner | pytest, jest, go test, cargo test |
| CI Action | `setup-python@v5`, `setup-node@v6` |
| .gitignore Entries | `node_modules/`, `__pycache__/`, `target/` |
| Build Commands | `npm run build`, `cargo build`, `go build` |

**Template**:

```markdown
**Matrice stack → contenu concret** :
- [Stack1] : `[Tool]` → `[Alternative]`; CI → `[Action]`;
  `.gitignore` → inclut `[entries]`; [conditional behavior]
- [Stack2] : CI → `[Action]`; `.gitignore` → `[entries]`;
  scripts dans `[manifest file]`
```

---

## Quality Checklist for New Prompts

Before submitting a new meta-prompt, verify:

**Structure**

- [ ] All 7 sections present (Frontmatter → License)
- [ ] Meta-prompt wrapped in triple-backtick code fence
- [ ] Version history includes at least v1.0.0 entry
- [ ] Real-world test case with GitHub repository link

**Content**

- [ ] Zero unresolved placeholders in deliverables
- [ ] Minimum 10 deliverable items specified
- [ ] Stack support matrix covers 2+ stacks
- [ ] Instructions de Génération has 7+ rules
- [ ] Checklist de Qualité split into 3+ categories

**Testing**

- [ ] Prompt tested with 3+ different inputs
- [ ] Generated artifacts compile/run without modification
- [ ] Test repository pushed to GitHub (public or private)
- [ ] Generation time documented (<2 minutes ideal)

**Documentation**

- [ ] Added to `docs/prompts-index.md` comparison matrix
- [ ] README.md table updated with new prompt row
- [ ] CHANGELOG.md entry created
- [ ] Usage example added to `docs/usage-examples.md`

**Compliance**

- [ ] No markdownlint violations (`npm run lint`)
- [ ] No bare URLs (all links use `[text](url)` format)
- [ ] Blank lines before/after lists (MD032)
- [ ] Follows repository CONTRIBUTING.md guidelines

---

## Example: Minimal Viable Prompt

```markdown
# CLI Builder Lite

**Version**: 1.0.0
**Stacks Supported**: Node.js, Python, Go
**Project Types**: CLI Tool
**Author**: valorisa
**Last Updated**: 2026-05-30

---

## Overview

CLI Builder Lite is a production-ready meta-prompt for generating command-line tools with argument parsing, help text, and basic testing. It produces 8+ files with **executable code** in under 60 seconds.

**Key Innovation**: Opinionated defaults for CLI patterns (commands, flags, config files) based on stack conventions.

---

## Usage

1. Copy this entire file
2. Paste into Claude 3.5+ or GPT-4
3. Describe your CLI tool:
   - ✅ "Python CLI for converting Markdown to PDF"
   - ✅ "Node.js CLI for minifying images"
   - ✅ "Go CLI for monitoring file changes"
4. Receive complete CLI project instantly

---

## The Meta-Prompt

````markdown
# Rôle
Tu es "CLI Builder Lite", un expert en création d'outils CLI multi-stack.

# Mission
Générer en UNE SEULE ÉTAPE un outil CLI fonctionnel avec parsing d'arguments,
help text, tests unitaires, et documentation d'usage.

[... rest of prompt ...]
````

---

## Real-World Test Results

**Test Case: Python Markdown to PDF CLI**

*Input*: "Python CLI for converting Markdown to PDF using pandoc"

*Output*: 10 files generated in 45 seconds

- ✅ Executable CLI with argparse
- ✅ 3 subcommands (convert, batch, config)
- ✅ 8 pytest tests
- ✅ CI workflow with Python 3.10-3.12 matrix

*Repository*: [md2pdf-cli](https://github.com/valorisa/md2pdf-cli)

---

## Version History

### v1.0.0 (2026-05-30)

Initial release with Node.js, Python, Go support.

---

## License

MIT License - Free to use, modify, and distribute.

---

## Prompt Evolution Guidelines

### When to Increment Version

- **Patch (X.Y.Z)**: Bug fixes, typo corrections, clarifications
- **Minor (X.Y.0)**: New stack support, new optional deliverables, expanded instructions
- **Major (X.0.0)**: Breaking changes to output structure, removed stacks, renamed sections

### Deprecation Policy

When deprecating features:

1. Mark as deprecated in CHANGELOG (one minor version in advance)
2. Remove in next major version
3. Update test cases to avoid deprecated patterns

**Example**:

```markdown
### v2.1.0 (2026-06-01)

**Deprecated**:

- Mixed bilingual README (use separate README.md + README_FR.md instead)
- Will be removed in v3.0.0
```

---

## Contributing

To add a new meta-prompt to Advanced Prompts Factory:

1. Fork this repository
2. Copy `docs/meta-prompt-template.md` → `prompts/your-prompt.md`
3. Fill all 7 sections following this guide
4. Test with 3+ real inputs, document results
5. Update `docs/prompts-index.md` and `README.md`
6. Submit PR with:
   - `feat(prompts): add [Prompt Name] v1.0.0`
   - Link to test repository in PR description

---

**Template Version**: 1.0.0
**Based on**: RepoArchitect Pro v2.1.0
**Maintained by**: valorisa
