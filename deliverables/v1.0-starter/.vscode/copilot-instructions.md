# Pilot Pack — Agent Instructions

This workspace is a browser automation starter package for a VS Code user.

## Required Behavior

- Ask before installing packages, changing settings, editing shortcuts, or starting setup.
- Keep browser automation headed and visible unless the user explicitly asks for headless mode.
- Prefer Playwright-managed Chromium for first setup because it is isolated from the user's daily Chrome profile.
- Ask before enabling Chrome remote debugging.
- Ask before opening real websites.
- Ask before filling forms with real data.
- Always pause before clicking Submit, Send, Pay, Save, Delete, Confirm, Finalize, or Continue on a real website.
- Do not ask the user to paste passwords, one-time codes, API keys, or private tokens into chat.
- Do not store browser profiles, cookies, or session state in this package.
- Use `examples/test-form.html` for the first verification.

## Setup Flow

1. Read `AGENT-SETUP-INSTRUCTIONS.md`.
2. Explain the setup plan in plain English.
3. Ask permission before running `setup/verify-browser-automation.ps1`.
4. Ask permission before starting Playwright MCP.
5. Ask permission before running `setup/windows-enable-chrome-debugging.ps1`.
6. Verify with the local test form.

## Safe Default Prompt

Use this pattern for real tasks:

```text
Use headed browser automation. Inspect the page first. Ask before filling real data. After filling, take a screenshot and wait for my approval before submitting.
```
