# Pilot Pack — Starter

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Free](https://img.shields.io/badge/price-free-success.svg)]()
[![Browser MCP](https://img.shields.io/badge/browser%20MCP-compatible-7C3AED.svg)]()
[![Permission-first](https://img.shields.io/badge/safety-permission--first-2C7BB6.svg)]()
[![Use this template](https://img.shields.io/badge/GitHub-Use%20this%20template-181717.svg?logo=github)]()

Giving an AI coding agent control of a browser is easy. Giving it one without it clicking the wrong thing is the hard part. The Starter is the operating model that makes the second one routine — agent drives a visible browser under supervision, every consequential action is permission-first, the human stays in the loop by default.

This is for an AI coding agent in your editor (Claude Code, Cursor, Copilot, Continue) that needs to drive a real browser. The simple test: if you are *building* a web page, this is not the right tool. If you are *controlling* one through a visible browser, this applies.

Existing patterns push you to one of two extremes: hand the agent the keys and hope, or refuse to drive the browser at all and stay stuck. The Starter is the third path — capability with brakes, pause-before-submit baked into the prompt patterns rather than bolted on after the fact.

## Files

| File | Purpose |
| --- | --- |
| `README.md` | This file |
| `PACKAGE.md` | Friendly overview of the package |
| `INSTALL.md` | Step-by-step setup guide |
| `AGENT-SETUP-INSTRUCTIONS.md` | Instructions for the recipient's AI agent |
| `CONSENT-AND-PERMISSIONS.md` | Permission and safe-use rules |
| `REFERENCE.md` | Quick usage prompts |
| `TROUBLESHOOTING.md` | Common setup fixes |
| `BIBLIOGRAPHY.md` | Public references and further reading |
| `CATALOG.md` | File-by-file inventory of this package |
| `LICENSE` | MIT |
| `guides/browser-automation-fundamentals.md` | Browser automation basics |
| `guides/form-automation-patterns.md` | Form-filling patterns |
| `guides/vscode-browser-integration.md` | VS Code and Playwright MCP setup model |
| `setup/windows-enable-chrome-debugging.ps1` | Permission-first Windows Chrome debug helper |
| `setup/verify-browser-automation.ps1` | Read-only setup checker |
| `examples/test-form.html` | Local safe test page |
| `.vscode/copilot-instructions.md` | Agent workspace instructions (auto-loaded by Copilot) |
| `.vscode/mcp.json` | Playwright MCP server config |

## Default Operating Model

Use visible browser automation first. Keep VS Code and the browser side by side. Let the agent do the repetitive clicks and typing, but keep the human in charge of approvals.

Want the advanced patterns from a working agent stack? See **Pilot Pack — Pro Toolkit** (3 battle-tested skills + TIPS playbook + ba_* reference). Available separately.
