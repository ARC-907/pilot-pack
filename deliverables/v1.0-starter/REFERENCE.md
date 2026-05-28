# Quick Reference

## Three demo prompts you can paste right now

These are ready to paste into Claude Code, Cursor, or Copilot. The agent should already have read `CONSENT-AND-PERMISSIONS.md` before you run them. Pause-before-submit is the default — none of these prompts ask the agent to click Submit on your behalf. All three target the local `examples/test-form.html` so you can try the package without leaving it.

Prompt 1 — basic fill:

```text
Open `examples/test-form.html` in my debug Chrome window. Identify each form field. Fill them with: name=Sample User, email=sample@example.com, message=Hello from the Pilot Pack. Pause before clicking Submit so I can review.
```

Prompt 2 — verify state:

```text
Take a screenshot of the test-form.html page after fill. Tell me which fields are populated and which are still empty. Don't click anything.
```

Prompt 3 — recover from failure:

```text
The form said "all fields are required" but I thought I filled them all. Re-read the page. Tell me which field is empty, fill it, and pause before resubmitting.
```

## Safe Prompt Pattern

```text
Use headed browser automation. Keep the browser visible. Tell me what you see before acting. Fill the page only after I approve, then wait before submitting.
```

## Local Smoke Test

```text
Open examples/test-form.html with browser automation. Fill it with fake test data. Take a screenshot. Do not click Submit until I say yes.
```

## Inspect A Page First

```text
Open [URL]. Inspect the page and list the forms, buttons, and fields you can see. Do not fill or click anything yet.
```

## Fill But Do Not Submit

```text
Open [URL]. Fill the form with this data: [paste non-sensitive data]. Stop before any final submit or confirmation button.
```

## Stop Or Correct The Agent

```text
Stop. Do not click anything else. Tell me the current page state.
```

```text
That field is wrong. Clear it and fill [field name] with [correct value].
```

## Useful Agent Actions

| Need | Ask The Agent |
| --- | --- |
| Open a page | `Navigate to [URL] and tell me what loaded.` |
| Read a page | `Take a page snapshot and summarize the visible fields.` |
| Fill a field | `Fill only the email field with test@example.com.` |
| Review before submit | `Take a screenshot and wait for approval.` |
| Save proof | `Take a screenshot of the confirmation page.` |
| Stop work | `Stop and do not take further browser actions.` |

## Practical Defaults

- Use headed mode.
- Use fake data for tests.
- Review before submit.
- Log in manually when needed.
- Keep VS Code and the browser side by side.
