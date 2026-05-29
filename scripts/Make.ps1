<#
.SYNOPSIS
    Build and validation automation for Advanced Prompts Factory

.DESCRIPTION
    PowerShell automation functions for linting, testing, and validating
    the Advanced Prompts Factory repository.

.NOTES
    Author: valorisa
    Version: 1.0.0
    Requires: PowerShell 7.6+
#>

#Requires -Version 7.6

# Strict mode for better error handling
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

#region Helper Functions

function Write-TaskHeader {
    <#
    .SYNOPSIS
        Writes a formatted task header to the console
    #>
    param(
        [Parameter(Mandatory)]
        [string]$TaskName
    )

    Write-Host "`n========================================" -ForegroundColor Cyan
    Write-Host " $TaskName" -ForegroundColor Cyan
    Write-Host "========================================`n" -ForegroundColor Cyan
}

function Write-Success {
    <#
    .SYNOPSIS
        Writes a success message to the console
    #>
    param(
        [Parameter(Mandatory)]
        [string]$Message
    )

    Write-Host "✓ $Message" -ForegroundColor Green
}

function Write-Failure {
    <#
    .SYNOPSIS
        Writes a failure message to the console
    #>
    param(
        [Parameter(Mandatory)]
        [string]$Message
    )

    Write-Host "✗ $Message" -ForegroundColor Red
}

function Test-CommandExists {
    <#
    .SYNOPSIS
        Tests if a command exists in PATH
    #>
    param(
        [Parameter(Mandatory)]
        [string]$Command
    )

    $null -ne (Get-Command $Command -ErrorAction SilentlyContinue)
}

#endregion

#region Main Functions

function Invoke-Lint {
    <#
    .SYNOPSIS
        Runs markdown linting on all .md files

    .DESCRIPTION
        Uses markdownlint-cli2 to validate all markdown files against
        the project's .markdownlint.json configuration.

    .EXAMPLE
        Invoke-Lint

    .NOTES
        Requires: markdownlint-cli2 (install via npm install -g markdownlint-cli2)
    #>
    [CmdletBinding()]
    param()

    Write-TaskHeader "Markdown Linting"

    # Check if markdownlint-cli2 is installed
    if (-not (Test-CommandExists 'markdownlint-cli2')) {
        Write-Failure "markdownlint-cli2 not found"
        Write-Host "Install with: npm install -g markdownlint-cli2" -ForegroundColor Yellow
        throw "Required tool not installed"
    }

    try {
        # Run markdownlint on all markdown files
        $result = npx markdownlint-cli2 "**/*.md" "#node_modules" 2>&1

        if ($LASTEXITCODE -eq 0) {
            Write-Success "All markdown files passed linting"
            return $true
        }
        else {
            Write-Failure "Markdown linting failed"
            Write-Host $result -ForegroundColor Red
            return $false
        }
    }
    catch {
        Write-Failure "Markdown linting encountered an error: $_"
        return $false
    }
}

function Invoke-LinkCheck {
    <#
    .SYNOPSIS
        Validates all links in markdown files

    .DESCRIPTION
        Checks all URLs and internal references in markdown files to ensure
        they are valid and accessible.

    .EXAMPLE
        Invoke-LinkCheck

    .NOTES
        Requires: markdown-link-check (install via npm install -g markdown-link-check)
    #>
    [CmdletBinding()]
    param()

    Write-TaskHeader "Link Validation"

    # Check if markdown-link-check is installed
    if (-not (Test-CommandExists 'markdown-link-check')) {
        Write-Failure "markdown-link-check not found"
        Write-Host "Install with: npm install -g markdown-link-check" -ForegroundColor Yellow
        throw "Required tool not installed"
    }

    try {
        $markdownFiles = Get-ChildItem -Path . -Filter "*.md" -Recurse -Exclude "node_modules"
        $allPassed = $true

        foreach ($file in $markdownFiles) {
            Write-Host "Checking links in $($file.Name)..." -ForegroundColor Gray

            $result = markdown-link-check $file.FullName 2>&1

            if ($LASTEXITCODE -ne 0) {
                Write-Failure "Link check failed for $($file.Name)"
                Write-Host $result -ForegroundColor Red
                $allPassed = $false
            }
            else {
                Write-Success "Links valid in $($file.Name)"
            }
        }

        if ($allPassed) {
            Write-Success "All links validated successfully"
            return $true
        }
        else {
            Write-Failure "Some link checks failed"
            return $false
        }
    }
    catch {
        Write-Failure "Link checking encountered an error: $_"
        return $false
    }
}

function Invoke-ValidatePrompts {
    <#
    .SYNOPSIS
        Validates prompt metadata

    .DESCRIPTION
        Ensures all prompt files in prompts/ directory contain required
        frontmatter metadata fields.

    .EXAMPLE
        Invoke-ValidatePrompts
    #>
    [CmdletBinding()]
    param()

    Write-TaskHeader "Prompt Metadata Validation"

    $requiredFields = @(
        '**Version**:',
        '**Stacks Supported**:',
        '**Project Types**:',
        '**Author**:'
    )

    $promptFiles = Get-ChildItem -Path "prompts" -Filter "*.md" -ErrorAction SilentlyContinue

    if ($promptFiles.Count -eq 0) {
        Write-Failure "No prompt files found in prompts/ directory"
        return $false
    }

    $allValid = $true

    foreach ($file in $promptFiles) {
        Write-Host "Validating $($file.Name)..." -ForegroundColor Gray

        $content = Get-Content $file.FullName -Raw

        foreach ($field in $requiredFields) {
            if ($content -notmatch [regex]::Escape($field)) {
                Write-Failure "$($file.Name) missing field: $field"
                $allValid = $false
            }
        }

        if ($allValid) {
            Write-Success "$($file.Name) metadata valid"
        }
    }

    if ($allValid) {
        Write-Success "All prompt metadata validated"
        return $true
    }
    else {
        Write-Failure "Some prompts have invalid metadata"
        return $false
    }
}

function Invoke-ValidateStructure {
    <#
    .SYNOPSIS
        Validates repository structure

    .DESCRIPTION
        Ensures all required files and directories exist in the repository.

    .EXAMPLE
        Invoke-ValidateStructure
    #>
    [CmdletBinding()]
    param()

    Write-TaskHeader "Repository Structure Validation"

    $requiredFiles = @(
        'README.md',
        'LICENSE',
        'CONTRIBUTING.md',
        'CODE_OF_CONDUCT.md',
        'SECURITY.md',
        'CHANGELOG.md',
        '.gitignore',
        '.editorconfig'
    )

    $requiredDirs = @(
        'prompts',
        'docs',
        'scripts',
        '.github/workflows',
        '.github/ISSUE_TEMPLATE'
    )

    $allValid = $true

    # Check files
    foreach ($file in $requiredFiles) {
        if (Test-Path $file) {
            Write-Success "Found $file"
        }
        else {
            Write-Failure "Missing required file: $file"
            $allValid = $false
        }
    }

    # Check directories
    foreach ($dir in $requiredDirs) {
        if (Test-Path $dir) {
            Write-Success "Found $dir/"
        }
        else {
            Write-Failure "Missing required directory: $dir/"
            $allValid = $false
        }
    }

    if ($allValid) {
        Write-Success "Repository structure validated"
        return $true
    }
    else {
        Write-Failure "Repository structure validation failed"
        return $false
    }
}

function Invoke-Test {
    <#
    .SYNOPSIS
        Runs the full test suite

    .DESCRIPTION
        Executes all validation checks: linting, link checking, prompt metadata,
        and structure validation.

    .EXAMPLE
        Invoke-Test

    .OUTPUTS
        Boolean indicating overall success
    #>
    [CmdletBinding()]
    param()

    Write-Host "`n╔══════════════════════════════════════════╗" -ForegroundColor Magenta
    Write-Host "║  Advanced Prompts Factory Test Suite   ║" -ForegroundColor Magenta
    Write-Host "╚══════════════════════════════════════════╝`n" -ForegroundColor Magenta

    $results = @{
        Lint            = Invoke-Lint
        LinkCheck       = Invoke-LinkCheck
        PromptValidation = Invoke-ValidatePrompts
        StructureCheck  = Invoke-ValidateStructure
    }

    Write-Host "`n========================================" -ForegroundColor Cyan
    Write-Host " Test Results Summary" -ForegroundColor Cyan
    Write-Host "========================================`n" -ForegroundColor Cyan

    $allPassed = $true

    foreach ($test in $results.GetEnumerator()) {
        if ($test.Value) {
            Write-Host "✓ $($test.Key): " -ForegroundColor Green -NoNewline
            Write-Host "PASSED" -ForegroundColor Green
        }
        else {
            Write-Host "✗ $($test.Key): " -ForegroundColor Red -NoNewline
            Write-Host "FAILED" -ForegroundColor Red
            $allPassed = $false
        }
    }

    Write-Host ""

    if ($allPassed) {
        Write-Host "🎉 All tests passed!" -ForegroundColor Green
        return $true
    }
    else {
        Write-Host "❌ Some tests failed" -ForegroundColor Red
        return $false
    }
}

function Invoke-Clean {
    <#
    .SYNOPSIS
        Cleans temporary and generated files

    .DESCRIPTION
        Removes temporary files, logs, and build artifacts.

    .EXAMPLE
        Invoke-Clean
    #>
    [CmdletBinding()]
    param()

    Write-TaskHeader "Cleaning Temporary Files"

    $cleanPatterns = @(
        '*.log',
        '*.tmp',
        'tmp/',
        'temp/',
        'node_modules/'
    )

    foreach ($pattern in $cleanPatterns) {
        $items = Get-ChildItem -Path $pattern -Recurse -ErrorAction SilentlyContinue

        if ($items) {
            foreach ($item in $items) {
                Remove-Item $item.FullName -Recurse -Force
                Write-Success "Removed $($item.Name)"
            }
        }
    }

    Write-Success "Cleanup complete"
}

#endregion

# Export functions
Export-ModuleMember -Function @(
    'Invoke-Lint',
    'Invoke-LinkCheck',
    'Invoke-ValidatePrompts',
    'Invoke-ValidateStructure',
    'Invoke-Test',
    'Invoke-Clean'
)

# Display usage information when script is dot-sourced
if ($MyInvocation.InvocationName -eq '.') {
    Write-Host "`nAdvanced Prompts Factory Build Functions Loaded`n" -ForegroundColor Cyan
    Write-Host "Available commands:" -ForegroundColor Yellow
    Write-Host "  Invoke-Lint              - Run markdown linting"
    Write-Host "  Invoke-LinkCheck         - Validate all links"
    Write-Host "  Invoke-ValidatePrompts   - Check prompt metadata"
    Write-Host "  Invoke-ValidateStructure - Validate repo structure"
    Write-Host "  Invoke-Test              - Run full test suite"
    Write-Host "  Invoke-Clean             - Clean temporary files`n"
}
