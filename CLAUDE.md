# Advanced Prompts Factory

## Project Documentation

- README.md (English version)
- README_FR.md (French version)

## Response Style

Ultra-concise responses. Remove articles, politeness phrases, reformulations.
Get to the point. Format: short bullet points. No intro, no conclusion.

## Reasoning Effort

- Simple task / known command → minimal effort, no extended thinking
- Design / architecture task → medium effort
- Complex unsolved problem → high effort only on explicit request
Never over-reason a simple task.

## Context Management

- Web search → isolated subagent with context fork
- PDF / transcription → subagent, return summary only
- Codebase exploration → use native explore agent
- Research tasks → delegate to subagent, return findings only

## File Operations

Specify explicit paths in commands. Don't scan unnecessarily.

## Session Rules

- Never add MCP/tool/skill mid-session → invalidates cache
- If critical addition needed → /compact → new session
- Keep this file minimal and stable
