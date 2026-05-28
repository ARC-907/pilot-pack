# Pilot Pack — Starter

This package gives a VS Code user a practical way to let an AI agent control a visible browser for supervised tasks: opening pages, clicking buttons, filling forms, taking screenshots, and pausing for review before anything important happens.

It is designed as a starter capability, not an unattended automation toolkit. The default mode is visible, permission-first, and supervised.

## What This Enables

- Ask an agent in VS Code to open a web page and inspect it.
- Fill simple forms from information you provide.
- Pause before clicking Submit so you can review the page.
- Capture screenshots of completed forms or confirmation pages.
- Use a local test form before trying any real website.

## What Is Included

- `INSTALL.md`: plain-English setup guide.
- `AGENT-SETUP-INSTRUCTIONS.md`: the first file the recipient's agent should read.
- `CONSENT-AND-PERMISSIONS.md`: rules for asking permission before setup or real-world use.
- `REFERENCE.md`: quick prompts and everyday usage patterns.
- `TROUBLESHOOTING.md`: common setup fixes.
- `.vscode/mcp.json`: a starter Playwright MCP configuration.
- `.vscode/copilot-instructions.md`: agent behavior rules for this package.
- `setup/`: Windows helper scripts for Chrome debug setup and verification.
- `examples/test-form.html`: a harmless local smoke-test page.
- `guides/`: sanitized background guides for browser automation, forms, and VS Code integration.

## Safe-Use Defaults

- The browser should be headed, meaning visible on screen.
- The agent must ask before installing tools or changing settings.
- The agent must ask before filling forms on real websites.
- The agent must ask again before clicking Submit, Pay, Delete, Send, Save, or any similar final action.
- Credentials should not be pasted into chat. Log in manually in the browser when needed.

## What This Is Not For

- Bypassing access controls, CAPTCHAs, or site restrictions.
- Hidden or unattended automation of real accounts.
- Collecting data from sites where you do not have permission.
- Storing passwords, cookies, session files, or personal browser profiles in this package.

## Recommended First Run

1. Open this folder in VS Code.
2. Ask your agent: `Read AGENT-SETUP-INSTRUCTIONS.md and walk me through setup. Ask before changing anything.`
3. Run `setup/verify-browser-automation.ps1` to check prerequisites.
4. Configure Playwright MCP only after approving the change.
5. Open `examples/test-form.html` and ask the agent to fill it, screenshot it, and wait before submitting.
