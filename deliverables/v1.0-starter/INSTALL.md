# Installation Guide

This guide is written for a VS Code user who wants browser automation to work safely and visibly.

> **OS note:** the `setup/*.ps1` scripts are Windows-only. macOS and Linux users install the Playwright MCP directly (see [Playwright MCP](https://github.com/microsoft/playwright-mcp)) — the rest of the package (guides, MCP config, agent instructions, test form) is OS-independent.

## Before You Start

Open this folder in VS Code. Ask your agent to read `AGENT-SETUP-INSTRUCTIONS.md` first.

The agent should ask before making any changes. Do not let it silently install tools or edit browser settings.

## What You Need

- VS Code or VS Code Insiders.
- GitHub Copilot Chat or another agent in VS Code that can use MCP tools.
- Google Chrome or Playwright-managed Chromium.
- Node.js LTS, which includes `npm` and `npx`.
- Internet access for the first install, because `npx @playwright/mcp@latest` downloads the MCP package.

## Step 1: Check Prerequisites

In PowerShell from this package folder, run:

```powershell
.\setup\verify-browser-automation.ps1
```

This script is read-only. It checks whether Node.js, npm, npx, VS Code CLI, Chrome, and the local MCP config are visible.

If Node.js is missing, install the LTS version from the official Node.js website, then open a new terminal and run the verification script again.

## Step 2: Add The Playwright MCP Server

This package includes `.vscode/mcp.json` with a starter server definition:

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

Open this folder in VS Code. Then use the Command Palette:

```text
Ctrl+Shift+P -> MCP: List Servers -> playwright -> Start
```

If VS Code asks for permission to run `npx`, approve it only if you are ready to install and run the Playwright MCP package.

## Step 3: Keep The Browser Visible

The intended default is headed mode: a visible browser window that you can watch.

Use this instruction in chat:

```text
Use headed browser automation. Keep the browser visible. Pause and ask before submitting anything.
```

Do not use headless mode unless you explicitly want automation to run without a visible browser.

## Step 4: Optional Chrome Debug Setup

Most users can start with the Playwright MCP browser. It is isolated from your normal Chrome profile and safer for first setup.

If you want agents to connect to regular Chrome through Chrome DevTools Protocol, run:

```powershell
.\setup\windows-enable-chrome-debugging.ps1
```

The script asks before changing shortcuts. It also uses a separate automation profile folder so your personal Chrome profile is not mixed into the automation session.

## Step 5: Smoke Test Locally

Open `examples/test-form.html` in a browser. Then ask your agent:

```text
Use Playwright browser automation to open examples/test-form.html, fill the sample form with test data, take a screenshot, and wait before clicking Submit.
```

Use fake data for the test.

## Step 6: First Real Use

For a real website, use supervised wording:

```text
Open this page: [URL]. Inspect the form first. Tell me what fields you see. Then ask before filling it. After filling it, show me the result and wait for my approval before submitting.
```

## Uninstall Or Undo

- Stop the MCP server from `MCP: List Servers` in VS Code.
- Remove or rename `.vscode/mcp.json` in this folder.
- If you changed Chrome shortcuts, remove `--remote-debugging-port=9222` from those shortcuts.
- If the script created a separate automation profile folder, you may delete that folder after Chrome is closed.
