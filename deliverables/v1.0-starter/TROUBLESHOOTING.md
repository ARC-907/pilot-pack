# Troubleshooting

## `node` Is Not Recognized

Install Node.js LTS, then close and reopen the terminal.

Check again:

```powershell
node --version
npm --version
npx --version
```

## MCP Server Does Not Start

Check that `npx` works:

```powershell
npx --version
```

Then start the server from VS Code:

```text
Ctrl+Shift+P -> MCP: List Servers -> playwright -> Start
```

If VS Code asks for permission to run `npx @playwright/mcp@latest`, approve only if you want to install/run the server.

## Browser Does Not Open

- Make sure the `playwright` MCP server is running.
- Ask the agent to use headed browser automation.
- Restart the MCP server from `MCP: List Servers`.
- Close extra automation browser windows and try again.

## Chrome Debug Port Is Not Available

Run the read-only verifier:

```powershell
.\setup\verify-browser-automation.ps1
```

If port 9222 is not listening, Chrome was not started with remote debugging. Run the Chrome helper only if you want this feature:

```powershell
.\setup\windows-enable-chrome-debugging.ps1
```

## Port 9222 Is Already In Use

Another Chrome or automation process may already be using the port.

- Close automation Chrome windows.
- Check Task Manager for leftover Chrome processes.
- Restart Chrome from the shortcut created or updated for automation.
- If needed, ask an agent to help choose another port, such as 9223.

## The Agent Clicked The Wrong Thing

Say:

```text
Stop. Do not click anything else. Tell me exactly what you did and what page state you see.
```

Then correct the field or reload the page.

## A Website Shows A Verification Challenge

Pause. Solve it manually only if you have permission to use the site. Do not ask the agent to bypass protective checks.

## A Form Contains Sensitive Information

Use supervised mode. Do not paste passwords or one-time codes into chat. Log in manually in the visible browser, then let the agent continue after you approve.

## How To Undo Chrome Shortcut Changes

Right-click the Chrome shortcut, choose Properties, and remove these arguments from the Target field if present:

```text
--remote-debugging-port=9222
--user-data-dir=...
```

Then close all Chrome windows and reopen Chrome normally.
