# Homebrew Tap for git-adr

This is the official [Homebrew](https://brew.sh/) tap for [git-adr](https://github.com/zircote/git-adr), a tool for managing Architecture Decision Records using git notes.

## Installation

```bash
# Add this tap
brew tap zircote/git-adr

# Install git-adr
brew install git-adr
```

Or install directly:

```bash
brew install zircote/git-adr/git-adr
```

## Updating

```bash
brew update
brew upgrade git-adr
```

## Uninstalling

```bash
brew uninstall git-adr
brew untap zircote/git-adr
```

## Post-Installation

To use git-adr as a git subcommand, add a git alias:

```bash
git config --global alias.adr '!git-adr'
```

Then you can use: `git adr new "My Decision"`

## What is git-adr?

git-adr is a CLI tool for managing Architecture Decision Records (ADRs) using git notes instead of files in your repository. This approach:

- Keeps your working tree clean (no ADR files)
- Integrates seamlessly with git workflows
- Survives rebases and amends
- Can be synced across remotes

Learn more at [github.com/zircote/git-adr](https://github.com/zircote/git-adr)

## Issues

For issues with the formula, please open an issue in this repository.

For issues with git-adr itself, please open an issue at [zircote/git-adr](https://github.com/zircote/git-adr/issues).
