# Architecture

Operational rules for agents live in `AGENTS.md`. This file is background.

## Intent

Personal git helpers for day-to-day work in zsh. `aliases.zsh` is sourced after Oh My Zsh so its definitions override the git plugin.

## Modules

One file, `aliases.zsh`. It clears names the Oh My Zsh git plugin already claims, then defines functions.

## Boundaries

Helpers that share a name with the Oh My Zsh git plugin are unaliased first, then redefined. Sourcing `aliases.zsh` before the plugin lets the plugin win.

## Runtime

zsh. The user sources `aliases.zsh` from `~/.zshrc` after `oh-my-zsh.sh`. There is no build step and no package.

## Out of scope

This repository does not ship Oh My Zsh, a git binary, or shell configuration beyond `aliases.zsh`.
