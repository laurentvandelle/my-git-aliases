# Git aliases and helpers.
# Source this AFTER Oh My Zsh so these definitions override the git plugin:
#   source /path/to/my-git-aliases/aliases.zsh

# Oh My Zsh's git plugin already claims some of these names.
unalias gac 2>/dev/null
unalias gac! 2>/dev/null
unalias grs 2>/dev/null
unalias grh 2>/dev/null
unalias gb 2>/dev/null
unalias gbd 2>/dev/null
unalias gcbr 2>/dev/null
unalias gpr 2>/dev/null

# Stage everything and commit with the given message.
gac() {
  git add --all
  git commit -m "$1"
}

# Stage everything and amend the last commit, keeping its message.
gac!() {
  git add --all
  git commit --amend --no-edit
}

# Soft-reset the last N commits (default 1), keeping the changes staged.
grs() {
  local count=${1:-1}
  git reset HEAD~$count
}

# Hard-reset the last N commits (default 1).
grh() {
  local count=${1:-1}
  git reset --hard HEAD~$count
}

# List local branches, most recently committed first.
gb() {
  git for-each-ref --sort=committerdate --format='%(committerdate:relative) %(refname:short)' refs/heads/
}

# Force-delete a local branch.
gbd() {
  git branch -D $1
}

# Check out a remote branch as a new local branch of the same name.
gcbr() {
  git fetch --all --prune
  git checkout remotes/origin/$1 -b $1
}

# Push the current branch and open a pull request.
# Branch must match [<type>/]<PREFIX>-<number>-<description>,
# e.g. PORTAIL-1-create-a-sidebar or feature/PORTAIL-14-reprendre-position-lecture.
# Extra arguments are forwarded to `gh pr create`.
gpr() {
  local branch title prefix number desc ticket
  branch=$(git branch --show-current) || return 1

  # Optional type prefix (feature/, fix/, tech/, …): keep what follows the first slash.
  ticket=${branch#*/}

  if [[ ! $ticket =~ ^([A-Za-z]+)-([0-9]+)-(.+)$ ]]; then
    echo "La branche '$branch' ne suit pas le format [<type>/]<prefix>-<card_number>-<description>"
    echo "Exemples : PORTAIL-1-create-a-sidebar"
    echo "           feature/PORTAIL-14-reprendre-position-lecture"
    return 1
  fi

  prefix=$match[1]
  number=$match[2]
  desc=${match[3]//-/ }
  title="[${prefix}-${number}] ${desc[1]:u}${desc[2,-1]}"

  git push -u origin HEAD || return 1
  gh pr create --title "$title" --body "" --assignee "@me" "$@" || return 1
  gh pr view --web
}

# Git worktree
alias gw='git worktree'
alias gwa='git worktree add'
alias gwb='git worktree add -b'
alias gwd='git worktree remove'
alias gwl='git worktree list'
