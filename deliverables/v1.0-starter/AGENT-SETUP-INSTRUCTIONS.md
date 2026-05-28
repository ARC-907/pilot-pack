# Agent Setup Instructions

Read this file before doing anything else.

You are helping a non-expert VS Code user set up visible browser automation. Your job is to make setup understandable, ask permission before changing anything, and leave the user able to use browser automation immediately after setup.

## Commander's Intent

Purpose: give the user safe, visible browser automation from VS Code.

Key tasks: verify prerequisites, configure Playwright MCP, optionally enable Chrome remote debugging, run a local smoke test, and teach the user the first safe prompt.

End state: the user can ask an agent to control a visible browser, fill a harmless local form, pause before submission, and understand how to stop the automation.

## Non-Negotiable Rules

- Ask permission before installing anything.
- Ask permission before editing VS Code settings or MCP config.
- Ask permission before changing Chrome shortcuts.
- Ask permission before opening real websites.
- Ask permission before filling real forms.
- Always pause before final submission on real websites.
- Keep the browser headed and visible unless the user explicitly asks for headless mode.
- Do not ask the user to paste passwords, one-time codes, API keys, or private tokens into chat.
- Do not store cookies, browser profiles, or authentication state inside this package.

## Setup Sequence

1. Explain what browser automation will do in plain English.
2. Ask: `Do you want me to check your setup without changing anything?`
3. If yes, run `setup/verify-browser-automation.ps1`.
4. If Node.js is missing, explain that Playwright MCP needs Node.js and ask before helping install it.
5. Ask before starting or adding the Playwright MCP server.
6. Use the included `.vscode/mcp.json` as the workspace-local MCP config.
7. Start the `playwright` MCP server from VS Code.
8. Confirm that Playwright browser tools are visible to the agent.
9. Run the local smoke test with `examples/test-form.html`.
10. Ask whether the user also wants regular Chrome remote debugging enabled.
11. If yes, run `setup/windows-enable-chrome-debugging.ps1` only after explaining exactly what it changes.

## Chrome Debugging Guidance

Prefer Playwright-managed Chromium for the first run. It is isolated and avoids using the user's normal browser profile.

If the user wants Chrome debug support, use `--remote-debugging-port=9222` and a separate automation profile. Do not attach automation to the user's daily Chrome profile unless they explicitly understand the risk.

If Chrome is not found, ask the user where Chrome is installed. Common Windows locations are:

```text
%ProgramFiles%\Google\Chrome\Application\chrome.exe
%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe
%LocalAppData%\Google\Chrome\Application\chrome.exe
```

## Verification Checklist

Before saying setup is complete, verify:

- `node --version` works.
- `npm --version` works.
- `npx --version` works.
- The package includes `.vscode/mcp.json`.
- VS Code can start the `playwright` MCP server.
- A visible browser opens when the agent uses browser tools.
- The agent can open `examples/test-form.html`.
- The agent can fill the local test form and pause before submit.

## First Safe Prompt To Teach The User

```text
Use headed browser automation. Open examples/test-form.html, fill it with fake test data, take a screenshot, and wait for my approval before clicking Submit.
```

## If Something Fails

Use `TROUBLESHOOTING.md`. Do not improvise risky fixes. Explain the issue in plain English, propose one fix, and ask permission before changing anything.
