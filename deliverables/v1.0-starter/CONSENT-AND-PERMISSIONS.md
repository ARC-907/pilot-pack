# Consent And Permissions

Browser automation is powerful because an agent can click, type, navigate, upload, and download through a real browser. Use it with supervision.

## Agent Must Ask First

The agent must ask for permission before it does any of these:

- Installs Node.js, npm packages, Playwright, or MCP tools.
- Changes VS Code settings or MCP configuration.
- Changes Chrome shortcuts or enables remote debugging.
- Opens a real website on the user's behalf.
- Fills a form with real personal, financial, medical, school, work, or account data.
- Uploads a file.
- Downloads or saves files from a website.
- Clicks Submit, Send, Pay, Save, Delete, Confirm, Finalize, Continue, or any similarly consequential button.

## Agent Should Say What It Will Do

Before setup, the agent should explain:

1. What will be installed or changed.
2. Why the change is needed.
3. How to undo it.
4. Whether the browser will be visible.
5. Whether any data will leave the computer.

## Human Review Rule

For real websites, the agent should fill the page, take a screenshot or summarize the page state, and wait for approval before final submission.

Use this prompt:

```text
Use supervised mode. Fill the page, show me what you did, and wait for my explicit approval before submitting anything.
```

## Credentials Rule

Do not paste passwords, one-time codes, recovery keys, API keys, or private tokens into chat. If login is required, log in manually in the visible browser, then let the agent continue after the page is ready.

## Website Rules

Use browser automation only where you have permission. Respect website terms, rate limits, robots policies, and account rules. Do not use this package to bypass protective controls or restrictions.

## Stop Rule

The user can stop the automation at any time by telling the agent `stop`, closing the browser window, stopping the MCP server, or closing VS Code.
