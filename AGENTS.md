# AGENTS.md

Instructions for every coding agent. Humans read `README.md` and `ARCHITECTURE.md`.

## Role

This repository holds personal zsh helpers for day-to-day git work. They are sourced after Oh My Zsh so they replace the git plugin's versions of the same names.

## Commands

Local setup is in `README.md`. This repository has no task runner and no scripts.

## Routing

- Before adding a dependency or crossing a module boundary, read `ARCHITECTURE.md`.
- Before naming a domain concept, read `CONTEXT.md`.
- Before writing an architecture decision, read `docs/adr/README.md`.
- Before changing these instruction files, read `docs/agents.md`.
- Before treating a convention as enforced, read `docs/guardrails.md`.
- Before adding a convention after review, read `docs/maintenance.md`.

## Non-negotiables

- The `AGENTS.md` closest to the file being changed wins over the root file.
- The code is the source of truth. When a document and the code disagree, report the gap. Do not invent a reconciliation in the same task.
- A rule lives in one file. Local rules live in the nearest `AGENTS.md`. The root file keeps shared rules only.
- Every helper is a zsh function in `aliases.zsh`, in the same shape as `gtf`. Unalias the name first when Oh My Zsh already claims it.

## Maintenance

Instruction upkeep is in `docs/maintenance.md`.
When a review finds a violation, follow that guide before adding a rule here.
