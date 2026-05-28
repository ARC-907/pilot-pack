# VS Code Browser Integration

VS Code can act as the control room for browser automation. The agent reasons in chat, and Playwright MCP provides browser tools that let the agent navigate, click, fill, and screenshot a visible browser.

## Architecture

```text
VS Code Agent <-> Playwright MCP Server <-> Visible Browser
```

The user sees two things:

- The agent's narration and tool calls in VS Code.
- The live browser window on the desktop.

This is the safest default because the user can stop or correct the agent at any time.

## MCP Configuration

This package includes `.vscode/mcp.json`:

```json
{
  "servers": {
    "playwright": {
      "command": "npx",
      "args": ["@playwright/mcp@latest"]
    }
  }
}
```

Start it from VS Code:

```text
Ctrl+Shift+P -> MCP: List Servers -> playwright -> Start
```

The first run may download the Playwright MCP package through `npx`.

## Common Browser Tools

Tool names can vary by agent environment, but common Playwright MCP actions include:

| Tool | Purpose |
| --- | --- |
| navigate | Open a URL |
| snapshot | Read page structure |
| click | Click an element |
| fill | Type into a field |
| select option | Choose from a dropdown |
| check / uncheck | Toggle a checkbox |
| screenshot | Capture the page |
| upload file | Attach a file after user approval |
| manage tabs | Open, switch, or close tabs |

## Supervised Workflow

A safe form workflow looks like this:

1. Navigate to the page.
2. Snapshot the page and identify fields.
3. Ask the user before filling real data.
4. Fill the fields.
5. Screenshot or summarize the filled page.
6. Ask for approval.
7. Submit only after approval.
8. Screenshot or summarize the confirmation page.

## Chrome Remote Debugging

Playwright MCP can usually launch its own browser. That is the easiest first setup.

Chrome remote debugging is optional. It lets browser tooling connect to Chrome through a local debug port. If enabled, use a separate automation profile and keep the browser visible.

On Windows, this package provides:

```powershell
.\setup\windows-enable-chrome-debugging.ps1
```

The script asks before changing shortcuts.

## First Test

Ask the agent:

```text
Open examples/test-form.html with headed browser automation. Fill it with fake data, take a screenshot, and wait before clicking Submit.
```

If that works, the user has the basic capability.

## Decision Rules

- If the user is new to browser automation, use Playwright-managed Chromium first.
- If the user asks for regular Chrome debug support, explain the profile and shortcut changes before applying them.
- If a real form is involved, pause before submit.
- If credentials are involved, have the user log in manually.
- If browser tools are not visible, verify the MCP server is started and Node.js is installed.
