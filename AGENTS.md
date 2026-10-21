# Repository instructions

Read [README.md](README.md), especially Formula maintenance, before changing
formulae or workflows. Follow the organization's
[maintenance change flow](https://github.com/agents-tools/.github/blob/master/MAINTENANCE.md#change-flow)
and inherited [contributing guide](https://github.com/agents-tools/.github/blob/master/CONTRIBUTING.md).

- Keep formula sources and checksums tied to the published release selected by
  the [agents release checklist](https://github.com/agents-tools/cli/blob/master/Documentation/Reference/Release.md).
  The CLI repository owns implementation and release preparation.
- Run the README's formula validation for formula changes, including source
  installation and tests for changed formulae. An empty `Formula/` inventory
  must succeed with a notice.
- For workflow edits, read the shared
  [integration guide](https://github.com/agents-tools/.github/blob/master/Documentation/Reference/WorkflowIntegration.md),
  run `actionlint`, and retain the required contexts `policy / policy` and
  `homebrew` from the organization
  [maintenance declaration](https://github.com/agents-tools/.github/blob/master/MAINTENANCE.md#activation-and-required-checks).
  Confirm those exact contexts on the candidate's real CI runs.
- Run `git diff --check origin/master` before handing off any change.
- Check the committed social preview with the `agents-tools/.github` standard
  pinned by `presentation` in CI; the README owns its local render/check loop.
  Keep caller ID `presentation` without inputs or dependencies. Its required
  context is activated only after a passing real PR run.
