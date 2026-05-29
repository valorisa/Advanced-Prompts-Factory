# Usage Examples

Real-world examples of using Advanced Prompts Factory meta-prompts to generate complete GitHub projects.

## Table of Contents

- [Example 0: Python CLI Tool (Validated Production Test)](#example-0-python-cli-tool-validated-production-test)
- [Example 1: PowerShell CLI Tool](#example-1-powershell-cli-tool)
- [Example 2: Python FastAPI Backend](#example-2-python-fastapi-backend)
- [Example 3: Node.js TypeScript Library](#example-3-nodejs-typescript-library)
- [Example 4: Bash Script Collection](#example-4-bash-script-collection)
- [Example 5: Nix Configuration Repository](#example-5-nix-configuration-repository)

---

## Example 0: Python CLI Tool (Validated Production Test)

**Real end-to-end test of RepoArchitect Pro v2.0 - Published on GitHub**

### User Input

```text
Python CLI tool for analyzing GitHub repository statistics (stars, forks, contributors, activity trends).
Uses GitHub API v3, outputs JSON/CSV reports, includes pytest tests and pre-commit hooks.
```

### Generation Results

- **Time**: 90 seconds
- **Files**: 24 generated
- **Lines**: 3,530 total (185 CLI + 212 tests)
- **Placeholders**: 0 verified
- **Repository**: https://github.com/valorisa/github-repository-analyzer

### Stack Detection (Phase 0 Silent Analysis)

- Python 3.10+
- pip package manager
- ruff linter + mypy type checker
- pytest + coverage
- CI: setup-python@v5

### Key Validation Points

✅ **Zero Placeholders**: Grep confirmed no TODO/FIXME/[Description]  
✅ **Executable Code**: CLI runs immediately after git clone  
✅ **Real Tests**: 15 pytest tests with fixtures and mocks  
✅ **Type Safety**: mypy strict mode passes  
✅ **CI/CD**: GitHub Actions with matrix testing (3.10, 3.11, 3.12)

### Generated File Structure

```
├── README.md (613 lines bilingual EN/FR)
├── src/github_stats/
│   ├── __init__.py
│   └── cli.py (185 lines - fully functional API client)
├── tests/test_cli.py (212 lines - 100% coverage ready)
├── .github/workflows/
│   ├── ci.yml (setup-python@v5, pytest, mypy, ruff)
│   └── release.yml (PyPI publishing)
├── pyproject.toml (full setuptools config)
├── requirements.txt + requirements-dev.txt
├── Makefile (venv, lint, test targets)
├── .pre-commit-config.yaml (ruff, mypy, bandit)
└── docs/ (architecture.md + usage.md with Mermaid diagrams)
```

### Code Quality Metrics

| Metric | Result |
|--------|--------|
| Python syntax errors | 0 |
| Placeholder count | 0 |
| Test coverage ready | 100% |
| Type checking | mypy strict ✅ |
| Linting | ruff ✅ |
| Security audit | bandit ✅ |

### README Features Demonstrated

- 20 GitHub topics for SEO
- Mermaid architecture diagram
- Complete bilingual EN/FR documentation
- Real troubleshooting section (5 common errors with solutions)
- Working code examples in all sections

### Live Repository

Visit [github.com/valorisa/github-repository-analyzer](https://github.com/valorisa/github-repository-analyzer) to see the complete generated project.

---

## Example 1: PowerShell CLI Tool

### Scenario

You want to create a PowerShell tool for parsing and analyzing IIS log files, with proper module structure, Pester tests, and CI/CD.

### User Input

```
Generate a PowerShell CLI tool called "IISLogAnalyzer" for parsing IIS log files
and generating statistics (requests per hour, status code distribution, slow queries).
Target PowerShell 7.6+ with Pester tests and GitHub Actions CI.
```

### Generated Structure

```
IISLogAnalyzer/
├── README.md (bilingual EN/FR, 2500+ words)
├── IISLogAnalyzer.psd1 (module manifest)
├── IISLogAnalyzer.psm1 (module loader)
├── Public/
│   ├── Get-IISLogStats.ps1
│   ├── ConvertFrom-IISLog.ps1
│   └── Export-LogReport.ps1
├── Private/
│   └── helpers.ps1
├── Tests/
│   ├── IISLogAnalyzer.Tests.ps1
│   └── fixtures/
│       └── sample.log
├── .github/
│   ├── workflows/
│   │   ├── ci.yml (PSScriptAnalyzer + Pester on windows-latest)
│   │   └── release.yml (PS Gallery publish)
│   └── ISSUE_TEMPLATE/ (with PS-specific environment fields)
├── scripts/
│   └── Make.ps1 (Install, Test, Lint, Build, Publish functions)
├── docs/
│   ├── architecture.md (with Mermaid diagram of log parsing pipeline)
│   └── usage-examples.md
├── CONTRIBUTING.md
├── CODE_OF_CONDUCT.md
├── SECURITY.md
├── CHANGELOG.md
├── LICENSE
├── .gitignore (PS-specific: *.ps1xml, Thumbs.db, etc.)
└── .editorconfig
```

### Key Stack-Specific Adaptations

**CI/CD (`ci.yml`)**:

```yaml
runs-on: windows-latest
steps:
  - uses: actions/checkout@v4
  - name: Run PSScriptAnalyzer
    shell: pwsh
    run: Invoke-ScriptAnalyzer -Path . -Recurse
  - name: Run Pester Tests
    shell: pwsh
    run: Invoke-Pester -Output Detailed
```

**.gitignore**:

```gitignore
# PowerShell
*.ps1xml
*_profile.ps1

# Windows
Thumbs.db
Desktop.ini
```

**Scripts (`Make.ps1`)**:

```powershell
function Invoke-Test {
    [CmdletBinding()]
    param()
    Invoke-Pester -Output Detailed -CI
}

function Invoke-Lint {
    [CmdletBinding()]
    param()
    Invoke-ScriptAnalyzer -Path . -Recurse -ReportSummary
}
```

---

## Example 2: Python FastAPI Backend

### Scenario

You're building a REST API for a task management system with authentication, database migrations, and Docker deployment.

### User Input

```
Generate a Python FastAPI backend for a task management API with:
- JWT authentication
- SQLAlchemy ORM with Alembic migrations
- Docker Compose for local dev (Postgres + Redis)
- pytest test suite
- Poetry for dependency management
Target Python 3.11+
```

### Generated Structure

```
taskmaster-api/
├── README.md (bilingual)
├── pyproject.toml (Poetry config with all dependencies)
├── app/
│   ├── __init__.py
│   ├── main.py
│   ├── config.py
│   ├── models/
│   │   ├── __init__.py
│   │   ├── task.py
│   │   └── user.py
│   ├── routers/
│   │   ├── __init__.py
│   │   ├── auth.py
│   │   └── tasks.py
│   ├── schemas/
│   │   ├── __init__.py
│   │   └── task.py
│   └── database.py
├── tests/
│   ├── __init__.py
│   ├── conftest.py
│   ├── test_auth.py
│   └── test_tasks.py
├── alembic/
│   ├── env.py
│   └── versions/
├── .github/workflows/
│   ├── ci.yml (setup-python@v5, pytest, ruff)
│   └── release.yml
├── docker-compose.yml (Postgres + Redis + API)
├── Dockerfile
├── Makefile (venv, install, test, lint, migrate targets)
├── docs/
│   ├── architecture.md (API request flow diagram)
│   └── api.md (OpenAPI/Swagger integration)
├── .env.example
├── .gitignore (Python-specific)
└── ...standard files...
```

### Key Stack-Specific Adaptations

**CI/CD (`ci.yml`)**:

```yaml
runs-on: ubuntu-latest
steps:
  - uses: actions/checkout@v4
  - uses: actions/setup-python@v5
    with:
      python-version: '3.11'
  - run: pip install poetry
  - run: poetry install
  - run: poetry run pytest --cov=app
  - run: poetry run ruff check .
```

**Makefile**:

```makefile
.PHONY: venv install test lint migrate

venv:
\tpython3 -m venv .venv

install:
\tpoetry install

test:
\tpoetry run pytest -v --cov=app

lint:
\tpoetry run ruff check .
\tpoetry run mypy app

migrate:
\tpoetry run alembic upgrade head
```

**.gitignore**:

```gitignore
# Python
__pycache__/
*.pyc
.venv/
.env
*.egg-info/
.coverage
.pytest_cache/
```

---

## Example 3: Node.js TypeScript Library

### Scenario

Building a markdown parsing library with TypeScript, published to npm.

### User Input

```
Generate a Node.js library called "md-utils" for parsing and manipulating markdown:
- TypeScript 5+
- ESM + CJS dual build
- Vitest for testing
- Bundle with tsup
- Publish to npm with provenance
Target Node.js 18+
```

### Generated Structure

```
md-utils/
├── README.md
├── package.json (with scripts, exports field for dual build)
├── tsconfig.json
├── tsup.config.ts (dual ESM/CJS output)
├── src/
│   ├── index.ts
│   ├── parser.ts
│   ├── transformer.ts
│   └── types.ts
├── tests/
│   ├── parser.test.ts
│   └── transformer.test.ts
├── examples/
│   ├── basic.ts
│   └── advanced.ts
├── .github/workflows/
│   ├── ci.yml (setup-node@v4, npm test, npm run lint)
│   └── release.yml (npm publish with provenance)
├── docs/
│   ├── api.md (TypeDoc integration)
│   └── usage-examples.md
├── .gitignore (Node.js-specific)
├── .eslintrc.json
└── ...standard files...
```

### Key Stack-Specific Adaptations

**package.json**:

```json
{
  "name": "md-utils",
  "version": "1.0.0",
  "type": "module",
  "exports": {
    ".": {
      "import": "./dist/index.js",
      "require": "./dist/index.cjs"
    }
  },
  "scripts": {
    "build": "tsup",
    "test": "vitest run",
    "lint": "eslint src/",
    "prepublishOnly": "npm run build && npm test"
  },
  "devDependencies": {
    "typescript": "^5.0.0",
    "tsup": "^8.0.0",
    "vitest": "^1.0.0",
    "eslint": "^8.0.0"
  }
}
```

**CI/CD (`ci.yml`)**:

```yaml
runs-on: ubuntu-latest
steps:
  - uses: actions/checkout@v4
  - uses: actions/setup-node@v4
    with:
      node-version: '20'
      cache: 'npm'
  - run: npm ci
  - run: npm run build
  - run: npm test
  - run: npm run lint
```

**.gitignore**:

```gitignore
# Node.js
node_modules/
dist/
.env
npm-debug.log
```

---

## Example 4: Bash Script Collection

### Scenario

Collection of system administration scripts for Linux servers.

### User Input

```
Generate a Bash script collection for Linux sysadmin tasks:
- Backup scripts (files, databases)
- Log rotation helpers
- System monitoring utilities
Include ShellCheck CI and comprehensive documentation
Target Bash 4.0+
```

### Generated Structure

```
sysadmin-scripts/
├── README.md
├── scripts/
│   ├── backup/
│   │   ├── backup-files.sh
│   │   └── backup-mysql.sh
│   ├── monitoring/
│   │   ├── disk-usage.sh
│   │   └── service-health.sh
│   └── maintenance/
│       └── rotate-logs.sh
├── config/
│   └── backup.conf.example
├── tests/
│   └── test-backup.bats (Bats test framework)
├── .github/workflows/
│   ├── ci.yml (shellcheck-action)
│   └── release.yml
├── docs/
│   ├── scripts-index.md (table of all scripts)
│   └── usage-examples.md
├── Makefile
├── .gitignore (Shell-specific)
└── ...standard files...
```

### Key Stack-Specific Adaptations

**CI/CD (`ci.yml`)**:

```yaml
runs-on: ubuntu-latest
steps:
  - uses: actions/checkout@v4
  - uses: koalaman/shellcheck-action@stable
    with:
      scandir: './scripts'
  - name: Run Bats tests
    run: |
      sudo apt-get install bats
      bats tests/
```

**docs/scripts-index.md**:

```markdown
| Script | Description | Usage | Requires Root |
|--------|-------------|-------|---------------|
| backup-files.sh | Backup directories with tar | `./backup-files.sh /path` | Yes |
| disk-usage.sh | Check disk usage alerts | `./disk-usage.sh` | No |
```

**.gitignore**:

```gitignore
# Shell
*.log
tmp/
*.backup
```

---

## Example 5: Nix Configuration Repository

### Scenario

NixOS system configuration with Home Manager integration.

### User Input

```
Generate a NixOS configuration repository with:
- Flake-based configuration
- Home Manager integration
- Multiple host profiles (desktop, laptop, server)
- Automated CI with nix flake check
Target NixOS 23.11+
```

### Generated Structure

```
nixos-config/
├── README.md
├── flake.nix (hosts, home-manager, nixpkgs inputs)
├── flake.lock
├── hosts/
│   ├── desktop/
│   │   ├── default.nix
│   │   └── hardware-configuration.nix
│   ├── laptop/
│   │   └── default.nix
│   └── server/
│       └── default.nix
├── modules/
│   ├── common.nix
│   └── desktop.nix
├── home/
│   ├── default.nix
│   └── programs/
│       ├── zsh.nix
│       └── neovim.nix
├── .github/workflows/
│   ├── ci.yml (cachix/install-nix-action)
│   └── release.yml
├── docs/
│   ├── architecture.md (system module graph)
│   └── usage-examples.md (rebuild commands)
├── Makefile (wraps nix commands)
├── .gitignore (Nix-specific)
└── ...standard files...
```

### Key Stack-Specific Adaptations

**CI/CD (`ci.yml`)**:

```yaml
runs-on: ubuntu-latest
steps:
  - uses: actions/checkout@v4
  - uses: cachix/install-nix-action@v27
    with:
      nix_path: nixpkgs=channel:nixos-unstable
  - run: nix flake check
  - run: nix flake show
```

**Makefile**:

```makefile
.PHONY: check build switch

check:
\tnix flake check

build:
\tnix build .#nixosConfigurations.desktop.config.system.build.toplevel

switch:
\tsudo nixos-rebuild switch --flake .#desktop
```

**.gitignore**:

```gitignore
# Nix
result
result-*
.direnv/
```

---

## Common Patterns Across Examples

### 1. Stack Detection Accuracy

All examples demonstrate correct stack detection:

- **PowerShell**: `windows-latest` runner, Pester, PSScriptAnalyzer
- **Python**: `setup-python@v5`, pytest, ruff/mypy
- **Node.js**: `setup-node@v4`, npm ci, Vitest/Jest
- **Bash**: `shellcheck-action`, Bats testing
- **Nix**: `install-nix-action`, flake-based

### 2. Zero Placeholder Guarantee

No examples contain:

- `[TODO]` comments
- `[Setup steps for your stack]` placeholders
- `[Description]` markers
- Generic `# Your code here` sections

### 3. Real, Executable Commands

Every `README.md` installation section has working commands:

```bash
# PowerShell example
git clone https://github.com/valorisa/IISLogAnalyzer.git
cd IISLogAnalyzer
Import-Module ./IISLogAnalyzer.psd1

# Python example
git clone https://github.com/valorisa/taskmaster-api.git
cd taskmaster-api
poetry install
poetry run uvicorn app.main:app

# Node.js example
git clone https://github.com/valorisa/md-utils.git
cd md-utils
npm install
npm run build
```

### 4. Stack-Specific `.gitignore`

Each project has tailored ignores:

- PowerShell: `*.ps1xml`, `Thumbs.db`
- Python: `__pycache__/`, `.venv/`, `*.egg-info/`
- Node.js: `node_modules/`, `dist/`, `.env`
- Bash: `*.log`, `tmp/`
- Nix: `result`, `.direnv/`

---

## Tips for Best Results

### 1. Be Specific About Your Stack

❌ Vague:
> "Generate a CLI tool"

✅ Specific:
> "Generate a **PowerShell 7.6+** CLI tool with **Pester** tests and **PSScriptAnalyzer** linting"

### 2. Mention Key Dependencies

❌ Generic:
> "Generate a Python API"

✅ Detailed:
> "Generate a **Python FastAPI** backend with **SQLAlchemy**, **Alembic** migrations, and **pytest** tests"

### 3. Specify Deployment Target

❌ Unclear:
> "Make it deployable"

✅ Clear:
> "Include **Docker Compose** for local dev and **GitHub Actions** for deployment to **Fly.io**"

### 4. Request Specific Features

❌ Open-ended:
> "Add some tests"

✅ Concrete:
> "Include **unit tests** with **pytest** and **integration tests** with **pytest-asyncio**, targeting **90%+ coverage**"

---

## Troubleshooting Generation Issues

### Issue: Generated files still have placeholders

**Cause**: LLM didn't fully understand the stack or ran out of tokens

**Solution**:

1. Be more explicit: "**Ensure zero placeholders** - all commands must be executable"
2. Simplify: Remove optional features to reduce output size
3. Use a larger context model (Claude 3.5 with 200K context)

### Issue: CI/CD uses wrong actions

**Cause**: Stack detection failed or was ambiguous

**Solution**:

1. Explicitly name the CI action: "Use `actions/setup-python@v5` in CI"
2. Provide version constraints: "Python 3.11+", "Node.js 18+"

### Issue: `.gitignore` is generic

**Cause**: Stack-specific patterns weren't triggered

**Solution**:
Add to your prompt: "Include **Python-specific** `.gitignore` with `__pycache__/`, `.venv/`, `*.egg-info/`"

---

## Next Steps

- [View all prompts](prompts-index.md)
- [Read architecture docs](architecture.md)
- [Contribute examples](../CONTRIBUTING.md)

---

**Last Updated**: 2026-05-29
