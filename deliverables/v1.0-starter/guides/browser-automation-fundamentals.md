# Browser Automation Fundamentals

Browser automation means controlling a browser with software: navigate pages, click elements, type into fields, read visible content, take screenshots, and wait for page changes.

For this package, the goal is supervised automation from VS Code. The user watches a visible browser while an agent does the repetitive work.

## Core Tools

The main browser automation frameworks are:

- Playwright: recommended default for new work. It supports Chromium, Firefox, and WebKit, has reliable waiting behavior, and works well with MCP.
- Puppeteer: useful for Chrome-only automation and lower-level browser debugging.
- Selenium: common in older test suites and broad language ecosystems.

For VS Code agent workflows, use Playwright MCP first.

## Headed And Headless

- Headed means the browser window is visible.
- Headless means the browser runs without a visible window.

Use headed mode by default. It is easier to trust because the user can watch actions, stop mistakes, and approve final steps.

Use headless mode only when the user explicitly asks for it and the task is low-risk and already tested.

## Selectors

Automation needs to identify page elements. Prefer stable, human-meaningful selectors:

1. Accessible roles and names, such as a button named Submit.
2. Labels, such as an input labeled Email.
3. Stable test IDs, if the site provides them.
4. CSS selectors only when semantic selectors are not enough.
5. XPath only as a last resort.

Good selectors make automation easier to maintain.

## Waiting

Web pages load asynchronously. Good automation waits for the right condition instead of sleeping for a fixed time.

Playwright automatically waits for buttons and fields to be ready before clicking or filling. When more control is needed, wait for a specific page condition, such as a success message or URL change.

Avoid fixed sleeps except as a visible slow-down for supervised demos.

## Browser Sessions

A browser session may contain cookies, local storage, and login state. Treat saved session files like credentials. Do not put them inside this package. Do not share them.

For first setup, prefer Playwright-managed Chromium because it is separate from the user's daily browser profile.

## Defensive Safety Rules

- Keep the browser visible for real tasks.
- Pause before final submission.
- Do not paste passwords or one-time codes into chat.
- Use fake data for smoke tests.
- Use a separate automation browser profile if Chrome remote debugging is enabled.
- Stop if the page shows unexpected account, payment, medical, legal, or personal data.

## Decision Rules

- If the user needs to watch the browser, use headed mode.
- If the task involves real data or real submissions, require review before submit.
- If a selector fails, inspect the page again instead of guessing.
- If login is required, ask the user to log in manually in the visible browser.
- If the website blocks or challenges automation, pause and ask the user what they want to do.
