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
  <a href="#quick-look">Quick look</a> ·
  <a href="#install">Install</a> ·
  <a href="#formula-maintenance">Formula maintenance</a> ·
  <a href="#contributing">Contributing</a> ·
  <a href="#license">License</a>
</p>

## Overview

This is the Homebrew tap for [agents](https://github.com/agents-tools/cli),
which installs and updates agent skills and instructions, resolved to exact
versions. Formulae track the upstream CLI releases; the tap has no independent
version or release tags.

## Quick look

```sh
brew tap agents-tools/tap
brew install agents-tools/tap/agents
agents --version
```

## Install

The Quick look installs the stable release selected by
[Formula/agents.rb](Formula/agents.rb)'s archive URL and SHA-256. Homebrew,
macOS 15 (Sequoia) or later, and Xcode 26.4 or later (Swift 6.3) are required.
Building from source also requires a macOS version supported by that Xcode release.

For a development build from the upstream `master` branch, use the HEAD
channel:

```sh
brew install --HEAD agents-tools/tap/agents
```

Both channels build the public [source repository](https://github.com/agents-tools/cli).

## Formula maintenance

Prepare formula updates after the upstream release is published, following the
[agents release checklist](https://github.com/agents-tools/cli/blob/master/Documentation/Reference/Release.md).
Select the release archive, verify its SHA-256 digest, and update the formula's
source URL, checksum, dependencies and test block as needed. Include the selected
release, digest and validation results in the pull request, as required by the
[family versioning standard](https://github.com/agents-tools/.github/blob/master/VERSIONING.md).

Use a fresh macOS environment with Homebrew and an unregistered
`agents-tools/tap` namespace. From a committed task worktree, run the
[shared Homebrew validation commands](https://github.com/agents-tools/github-workflows#local-validation)
using a checkout of the shared workflow repository at the accepted CI revision:

```sh
bash /path/to/github-workflows/scripts/check-homebrew agents-tools/tap
# Also source-install and test changed formulae:
bash /path/to/github-workflows/scripts/check-homebrew agents-tools/tap origin/master HEAD
```

The shared script temporarily registers this checkout as the tap and removes
that registration on exit. It runs `brew style` and `brew audit --strict` for
every `Formula/*.rb`. With base and head revisions, it also runs
`brew install --build-from-source` and `brew test` for changed formulae that
still exist. Source installation modifies the local Homebrew installation.
With no formulae, validation succeeds with a notice.

On pull requests, CI uses the PR base and head to select changed formulae and
validates the checkout's test merge commit. Deleted formulae are not installed.
The required contexts are `policy / policy` and `homebrew / homebrew`, supplied
by the pinned reusable workflows in `agents-tools/github-workflows`. Both
workflows run on branch pushes and pull requests. Title edits rerun only source
policy. Both workflows also support manual dispatch.

For workflow changes, run `actionlint` on every workflow.

## Social preview

Render and check the committed
[social preview](.github/assets/social-preview/social-preview.png) locally with
the [github-readme-design toolchain](https://github.com/showxu/skills/blob/master/skills/github-readme-design/references/renderers.md).
Use the `agents-tools/.github` standard's `DESIGN.md`, `.github/design/fonts`,
`profile/catalog.json` and light-page icon at `profile/assets/icon.png`, with
repository selector `homebrew-tap`. Follow the toolchain's documented render
and check commands, review the generated PNG and commit it.

## Contributing

Read the organization's
[contributing guide](https://github.com/agents-tools/.github/blob/master/CONTRIBUTING.md)
and follow its
[maintenance change flow](https://github.com/agents-tools/.github/blob/master/MAINTENANCE.md#change-flow).
The [formula maintenance instructions](#formula-maintenance) above own this
repository's development and validation commands.

## License

Available under the [MIT License](LICENSE).
