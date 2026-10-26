---
description: Tie agents formula updates to published releases and validate formulae, workflows and previews.
---
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
  [workflow guide](https://github.com/agents-tools/github-workflows#calling-homebrew-validation),
  run `actionlint` on every workflow, and retain the required contexts
  `policy / policy` and `homebrew / homebrew`. Confirm those exact contexts on
  the candidate's real CI runs before required-check activation.
- Render and check the committed social preview locally with the
  [github-readme-design toolchain](https://github.com/showxu/skills/blob/master/skills/github-readme-design/references/renderers.md)
  and the `agents-tools/.github` standard inputs. Follow the README's local
  validation instructions and commit reviewed assets.
