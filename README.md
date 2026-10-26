# my-git-aliases

Git aliases for my day to day work.

## Getting started

Requires [zsh](https://www.zsh.org/).

Clone the repo:

```sh
git clone git@github.com:laurentvandelle/my-git-aliases.git ~/PERSO/my-git-aliases
```

Source it from `~/.zshrc`, **after** Oh My Zsh. The file unaliases names the git plugin already claims (`gac`, `gb`, `grh`, `gw`, and others), so loading it earlier lets the plugin win.

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
| `g` | Run `git` |
| `gst` | Show `git status` |
| `glo` | One-line decorated log (`git log --oneline --decorate`) |
| `glg` | Log with diffstat (`git log --stat`) |
| `glgg` | Graph log (`git log --graph`) |
| `gp` | Push (`git push`) |
| `gco` | Check out a branch or path (`git checkout`) |
| `gcb` | Create a branch and check it out (`git checkout -b`) |
| `gtf <tag>` | Fetch `origin`, move `<tag>` to `origin/master`, and force-push it |
| `gac "message"` | Stage everything and commit |
| `gac!` | Stage everything and amend the last commit, keeping its message |
| `grs [n]` | Soft-reset the last `n` commits (default 1) |
| `grh [n]` | Hard-reset the last `n` commits (default 1) |
| `gb` | List local branches, most recently committed first (current branch in green, others in cyan) |
| `gbd <branch>` | Force-delete a local branch |
| `gcbr <branch>` | Fetch and check out `origin/<branch>` as a new local branch |
| `gw` | Run `git worktree` |
| `gwa` | Add a worktree (`git worktree add`) |
| `gwb` | Add a worktree and create its branch (`git worktree add -b`) |
| `gwd` | Remove a worktree (`git worktree remove`) |
| `gwl` | List worktrees (`git worktree list`) |
