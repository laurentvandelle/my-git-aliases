# my-git-aliases

Git aliases for my day to day work.

## Getting started

Requires [zsh](https://www.zsh.org/). `gpr` also needs the [GitHub CLI](https://cli.github.com/) (`gh`).

Clone the repo:

```sh
git clone git@github.com:laurentvandelle/my-git-aliases.git ~/PERSO/my-git-aliases
```

Source it from `~/.zshrc`, **after** Oh My Zsh. The file unaliases a few names the git plugin already claims (`gac`, `gb`, `grh`, and others), so loading it earlier lets the plugin win.

```zsh
source $ZSH/oh-my-zsh.sh
source ~/<PATH_TO_THE_REPO>/my-git-aliases/aliases.zsh
```

Reload the shell:

```sh
exec zsh
```

If those helpers were previously defined inline in `~/.zshrc`, delete that block. Sourcing `aliases.zsh` replaces it.

| Command | What it does |
| --- | --- |
| `gac "message"` | Stage everything and commit |
| `gac!` | Stage everything and amend the last commit, keeping its message |
| `grs [n]` | Soft-reset the last `n` commits (default 1) |
| `grh [n]` | Hard-reset the last `n` commits (default 1) |
| `gb` | List local branches, most recently committed first |
| `gbd <branch>` | Force-delete a local branch |
| `gcbr <branch>` | Fetch and check out `origin/<branch>` as a new local branch |
| `gpr` | Push the current branch and open a pull request |
| `gw` / `gwa` / `gwb` / `gwd` / `gwl` | `git worktree` list, add, add `-b`, remove, list |

`gpr` expects the current branch to match `[<type>/]<PREFIX>-<number>-<description>`, for example `PORTAIL-1-create-a-sidebar` or `feature/PORTAIL-14-reprendre-position-lecture`. Extra arguments are forwarded to `gh pr create`.
