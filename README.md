<p align="center">
  <a href="https://github.com/agents-tools/cli">
    <img src="https://raw.githubusercontent.com/agents-tools/.github/12f1ad84bd9536d6311f7c3e2c92feef54e34a9e/profile/assets/icon.png" width="160" alt="agents logo">
  </a>
</p>

<h1 align="center">homebrew-tap</h1>

<p align="center">Install agents with Homebrew.</p>

<p align="center">
  <a href="https://github.com/agents-tools/homebrew-tap/actions/workflows/ci.yml"><img src="https://github.com/agents-tools/homebrew-tap/actions/workflows/ci.yml/badge.svg?branch=master" alt="CI"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/license-MIT-blue" alt="License: MIT"></a>
</p>

<p align="center">
  <a href="#overview">Overview</a> ·
  <a href="#install">Install</a> ·
  <a href="#formula-maintenance">Formula maintenance</a> ·
  <a href="#contributing">Contributing</a> ·
  <a href="#license">License</a>
</p>

## Overview

This is the Homebrew tap for [agents](https://github.com/agents-tools/cli),
a package manager for agent skills and instructions. Formulae track the
upstream CLI releases; the tap has no independent version or release tags.

## Install

There is no formula yet. The first agents release adds `Formula/agents.rb`.
Until then, [build agents from source](https://github.com/agents-tools/cli#install).

## Formula maintenance

Prepare formula updates after the upstream release is published, following the
[agents release checklist](https://github.com/agents-tools/cli/blob/master/Documentation/Reference/Release.md).
Select the release archive, verify its SHA-256 digest, and update the formula's
source URL, checksum, dependencies and test block as needed. Include the selected
release, digest and validation results in the pull request, as required by the
[family versioning standard](https://github.com/agents-tools/.github/blob/master/VERSIONING.md).

Use a fresh macOS environment with Homebrew. From a committed task worktree,
tap that checkout and validate every `Formula/*.rb`:

```sh
brew tap --custom-remote agents-tools/tap "$PWD"
bash Scripts/check
```

`Scripts/check` runs `brew style` and `brew audit --strict` for every formula.
To also install changed formulae from source and run `brew test`, pass the
comparison base and head:

```sh
bash Scripts/check origin/master HEAD
```

With no formulae, the check succeeds with a notice. On pull requests, CI uses
the PR base and head to select changed formulae and validates the checkout's
test merge commit. Deleted formulae are not installed.

The required contexts are `policy / policy` and `homebrew`. Source policy calls
the pinned family workflow; `homebrew` runs the checks above on macOS. Both
workflows run on branch pushes and pull requests. Title edits rerun only source
policy. Both workflows also support manual dispatch.

For workflow changes, run these checks as well:

```sh
actionlint
git diff --check origin/master
```

## Contributing

Read the organization's
[contributing guide](https://github.com/agents-tools/.github/blob/master/CONTRIBUTING.md)
and follow its
[maintenance change flow](https://github.com/agents-tools/.github/blob/master/MAINTENANCE.md#change-flow).
The [formula maintenance instructions](#formula-maintenance) above own this
repository's development and validation commands.

## License

Available under the [MIT License](LICENSE).
