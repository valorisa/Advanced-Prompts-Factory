# Architecture Documentation

## Overview

Advanced Prompts Factory is a documentation-centric repository that provides meta-prompts for generating complete GitHub projects. The architecture is designed for simplicity, extensibility, and ease of use.

## System Architecture

```mermaid
graph TB
    A[User] --> B[Meta-Prompt Selection]
    B --> C[LLM Engine Claude/GPT-4]
    C --> D{Phase 0: Stack Analysis}
    D --> E[Language Detection]
    D --> F[Project Type Detection]
    E --> G[Decision Matrix]
    F --> G
    G --> H[Template Selection]
    H --> I[File Generation Engine]
    I --> J[Quality Validation]
    J --> K[Complete Project Output]
    
    L[Prompt Repository] --> B
    M[Stack Knowledge Base] --> D
    N[Template Library] --> H
    
    style D fill:#e1f5ff
    style G fill:#fff3cd
    style J fill:#d4edda
    style K fill:#d1ecf1
```

## Component Breakdown

### 1. Prompt Repository

**Location**: `prompts/`

**Purpose**: Stores versioned meta-prompt templates

**Structure**:

```
prompts/
├── repoarchitect-pro.md      # Flagship meta-prompt
├── [future-prompt-1].md      # Future additions
└── [future-prompt-2].md
```

**Key Features**:

- Semantic versioning for each prompt
- Frontmatter metadata (version, stacks, types, author, date)
- Self-contained prompt specification
- Usage instructions embedded

**Metadata Schema**:

```yaml
Version: X.Y.Z
Stacks Supported: [comma-separated list]
Project Types: [comma-separated list]
Author: [GitHub username]
Last Updated: YYYY-MM-DD
```

### 2. Stack Knowledge Base

**Embedded in**: Meta-prompt Phase 0 logic

**Purpose**: Maps technology stacks to concrete implementation details

**Decision Matrix**:

```mermaid
flowchart LR
    A[Project Description] --> B{Language Detection}
    B -->|PowerShell| C[PS Stack Config]
    B -->|Node.js| D[Node Stack Config]
    B -->|Python| E[Python Stack Config]
    B -->|Nix| F[Nix Stack Config]
    B -->|Shell| G[Shell Stack Config]
    B -->|Unknown| H[Universal Config]
    
    C --> I[CI: windows-latest]
    D --> J[CI: setup-node@v4]
    E --> K[CI: setup-python@v5]
    F --> L[CI: cachix/install-nix]
    G --> M[CI: shellcheck-action]
    
    I --> N[Makefile Alternative]
    J --> O[package.json scripts]
    K --> P[Makefile with venv]
    L --> Q[Nix flake.nix]
    M --> R[Standard Makefile]
```

**Stack Mappings**:

| Stack | Package Manager | Linter | Test Runner | CI Action | Build Tool |
|-------|----------------|--------|-------------|-----------|------------|
| PowerShell | PSGallery | PSScriptAnalyzer | Pester | setup-powershell | Invoke-Build |
| Node.js | npm/yarn/pnpm | ESLint | Jest/Vitest | setup-node@v4 | npm scripts |
| Python | pip/poetry | ruff/flake8 | pytest | setup-python@v5 | Makefile |
| Nix | nix flake | nixfmt | nix flake check | install-nix-action | nix build |
| Bash | N/A | shellcheck | bats | shellcheck-action | Makefile |

### 3. Template Library

**Embedded in**: Meta-prompt instructions

**Purpose**: Provides reusable file templates with placeholder injection points

**File Categories**:

1. **Documentation**: README.md (EN), README_FR.md (FR), CONTRIBUTING.md, CODE_OF_CONDUCT.md
2. **Legal**: LICENSE, SECURITY.md
3. **Versioning**: CHANGELOG.md
4. **Configuration**: .gitignore, .editorconfig, .markdownlint.json
5. **CI/CD**: .github/workflows/ci.yml, release.yml, dependabot.yml
6. **Templates**: Pull request template, issue templates
7. **Docs**: docs/architecture.md, docs/usage-examples.md

**Template Adaptation Flow**:

```mermaid
sequenceDiagram
    participant User
    participant LLM
    participant Phase0 as Phase 0 Analysis
    participant Matrix as Decision Matrix
    participant Template as Template Engine
    participant Output

    User->>LLM: Project description
    LLM->>Phase0: Extract stack + type
    Phase0->>Matrix: Query mappings
    Matrix-->>Phase0: Stack config
    Phase0->>Template: Inject config
    Template->>Template: Replace placeholders
    Template->>Output: Generate files
    Output-->>User: Complete project
```

### 4. Quality Validation

**Location**: CI/CD workflows + embedded checklists

**Purpose**: Ensure generated projects meet quality standards

**Validation Layers**:

```mermaid
graph TD
    A[Generated Project] --> B{Markdown Lint}
    B -->|Pass| C{Link Check}
    B -->|Fail| Z[Reject]
    C -->|Pass| D{Placeholder Check}
    C -->|Fail| Z
    D -->|Pass| E{Metadata Validation}
    D -->|Fail| Z
    E -->|Pass| F{Structure Validation}
    E -->|Fail| Z
    F -->|Pass| G[Accept]
    F -->|Fail| Z
    
    style B fill:#fff3cd
    style C fill:#fff3cd
    style D fill:#fff3cd
    style E fill:#fff3cd
    style F fill:#fff3cd
    style G fill:#d4edda
    style Z fill:#f8d7da
```

**Quality Checks**:

1. **Zero Placeholder**: No `[TODO]`, `[Description]`, `[Setup steps]` in output
2. **Executable Code**: All commands run without modification
3. **Stack Accuracy**: `.gitignore`, CI/CD, Makefile match detected stack
4. **Bilingual Completeness**: EN/FR sections present and translated
5. **Markdown Compliance**: Zero markdownlint violations
6. **Link Integrity**: All URLs and references valid

## Data Flow

### End-to-End Generation Flow

```mermaid
sequenceDiagram
    autonumber
    
    participant User
    participant Repo as Prompt Repository
    participant LLM as LLM Engine
    participant Analyzer as Stack Analyzer
    participant Generator as File Generator
    participant Validator as Quality Validator
    participant Output as User Workspace

    User->>Repo: Select meta-prompt
    Repo-->>User: Copy prompt text
    User->>LLM: Paste prompt + project description
    LLM->>Analyzer: Invoke Phase 0 analysis
    Analyzer->>Analyzer: Detect language
    Analyzer->>Analyzer: Detect project type
    Analyzer->>LLM: Return stack config
    LLM->>Generator: Generate files with config
    Generator->>Generator: Apply templates
    Generator->>Generator: Inject stack-specific content
    Generator->>Validator: Run quality checks
    Validator-->>Generator: Validation results
    Generator->>LLM: Finalize output
    LLM-->>User: Complete project (15+ files)
    User->>Output: Copy files to workspace
```

## Extensibility Points

### Adding New Meta-Prompts

1. **Create prompt file** in `prompts/`
2. **Follow standard structure**:
   - Frontmatter metadata
   - Overview section
   - Usage instructions
   - The meta-prompt content
   - Changelog (if update)
3. **Add to index** in `docs/prompts-index.md`
4. **Test with 3+ project types**
5. **Submit PR**

### Adding New Stack Support

1. **Extend Decision Matrix** in Phase 0 section
2. **Define stack mappings**:
   - Package manager
   - Linter
   - Test runner
   - CI action
   - Build tool
3. **Add .gitignore patterns**
4. **Document in README**
5. **Test generation**

### Adding New File Templates

1. **Identify file category** (docs, config, CI/CD, etc.)
2. **Create template** with placeholder markers
3. **Add to prompt instructions**
4. **Update quality checklist**
5. **Test with multiple stacks**

## Security Considerations

### Threat Model

| Threat | Mitigation |
|--------|------------|
| Malicious prompt injection | User reviews before execution |
| Generated code vulnerabilities | Quality checklist includes security review |
| Secrets in generated files | .gitignore templates exclude credentials |
| Supply chain attacks | Dependabot monitors action versions |

### Security Best Practices

1. **Review Generated Output**: Always inspect before committing
2. **Secrets Scanning**: Use GitHub secret scanning on generated repos
3. **Dependency Pinning**: CI/CD uses pinned action versions
4. **No Execution by Default**: Prompts generate code, don't execute it

## Performance Characteristics

### Token Efficiency

- **Average prompt size**: ~3,000 tokens
- **Average output size**: ~15,000-25,000 tokens (15+ files)
- **Total conversation cost**: ~30,000-40,000 tokens per project

**Optimization Strategies**:

- Single-pass generation (no iterative refinement)
- Compressed template syntax
- Stack detection reuses patterns across files

### Generation Time

- **LLM processing**: 30-90 seconds (depends on model)
- **User copy-paste**: 5-10 seconds
- **Total time**: < 2 minutes for complete project

## Maintenance

### Version Management

**Prompt Versioning**:

- Follow Semantic Versioning (SemVer)
- Breaking changes = major version bump
- New features = minor version bump
- Bug fixes = patch version bump

**Repository Versioning**:

- Tags: `v1.0.0`, `v1.1.0`, etc.
- Releases: GitHub Releases with changelog
- CHANGELOG.md: Keep a Changelog format

### Monitoring

**Metrics Tracked**:

- Prompt usage (via GitHub traffic)
- Issue frequency by prompt
- PR contribution rate
- Stack distribution (from issue templates)

## Future Architecture

### Roadmap

```mermaid
timeline
    title Advanced Prompts Factory Roadmap
    section Phase 1 (Current)
        Meta-prompt repository : RepoArchitect Pro v2.0
                                : Documentation-only
    section Phase 2 (Q3 2026)
        CLI Tool : Automated prompt usage
                 : Local validation
    section Phase 3 (Q4 2026)
        Web Interface : Interactive prompt builder
                      : Real-time preview
    section Phase 4 (2027)
        API Service : Programmatic access
                    : Webhook integrations
```

### Planned Enhancements

1. **CLI Tool**:
   - Command: `apt gen --prompt repoarchitect-pro --stack python`
   - Validates output locally
   - Git integration (auto-commit)

2. **Web Interface**:
   - Visual prompt customization
   - Stack selection dropdown
   - Real-time preview
   - One-click download

3. **API Service**:
   - REST API endpoints
   - Webhook support for CI/CD integration
   - Rate limiting and authentication

## Conclusion

Advanced Prompts Factory's architecture prioritizes:

- **Simplicity**: Documentation-only, no complex build systems
- **Extensibility**: Easy to add new prompts and stacks
- **Quality**: Multi-layer validation ensures reliable output
- **Performance**: Single-pass generation with token efficiency

The modular design allows future enhancements (CLI, web UI, API) without disrupting the core prompt repository.
