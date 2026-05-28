# Form Automation Patterns

Form automation is browser automation focused on filling and submitting web forms. It is useful for repetitive data entry, but it should stay supervised when the data or outcome matters.

## Supervision Levels

### Supervised

The browser is visible. The agent fills fields, shows the result, and waits before submission.

Use this for:

- First runs.
- Forms with personal data.
- Financial, school, work, legal, medical, or account-related forms.
- Any task where a mistake would be hard to undo.

### Semi-Autonomous

The agent completes a small batch, then pauses for review.

Use this only after several supervised runs work correctly.

### Autonomous

The agent runs without review. This is only appropriate for low-risk, tested workflows, such as local test data or internal non-sensitive forms.

## Field Mapping

The core task is matching data to fields:

- Name goes to Name.
- Email goes to Email.
- State goes to State.
- Attachment goes to Upload.

Agents can infer mappings from labels, but they can be wrong. For real forms, have the agent inspect the form first and tell the user what fields it sees.

Safe prompt:

```text
Inspect the form first. Tell me each field you see and what data you think belongs there. Do not fill anything until I approve.
```

## Common Field Types

| Field Type | Safe Handling |
| --- | --- |
| Text input | Fill normally, then read back if important |
| Textarea | Fill normally |
| Dropdown | Select by visible label when possible |
| Checkbox | Check only when the user explicitly wants it |
| Radio button | Select the exact visible option |
| Date picker | Try direct entry first; if needed, use the visible calendar |
| File upload | Ask before uploading any file |
| Login field | Let the user log in manually when credentials are involved |
| Verification challenge | Pause for the user |

## Review Before Submit

For real forms, the agent should:

1. Fill the page.
2. Take a screenshot or summarize visible values.
3. Ask the user to review.
4. Wait for explicit approval.
5. Click Submit only after approval.

Use this prompt:

```text
Fill the form, then stop. Take a screenshot and wait for my approval before submitting.
```

## Error Recovery

If something goes wrong:

- Stop clicking.
- Read the current page state.
- Report the last action.
- Ask the user what to do next.

Do not keep retrying a real form blindly.

## Batch Work

For repeated forms, process one or two records first. After the user approves the behavior, continue in small batches with review checkpoints.

Track each record as pending, submitted, failed, or skipped so the work can resume without starting over.

## Decision Rules

- If a field mapping is uncertain, ask the user.
- If the page shows validation errors, stop and report them.
- If more than a few records fail, pause the batch and investigate.
- If a file upload is needed, ask before selecting the file.
- If a challenge or verification step appears, pause for the user.
