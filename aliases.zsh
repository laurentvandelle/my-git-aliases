# Git aliases and helpers.
# Source this AFTER Oh My Zsh so these definitions override the git plugin:
#   source /path/to/my-git-aliases/aliases.zsh

# Oh My Zsh's git plugin already claims some of these names.
unalias g 2>/dev/null
unalias gac 2>/dev/null
unalias gac! 2>/dev/null
unalias gb 2>/dev/null
unalias gbd 2>/dev/null
unalias gcb 2>/dev/null
unalias gcbr 2>/dev/null
unalias gco 2>/dev/null
unalias glg 2>/dev/null
unalias glgg 2>/dev/null
unalias glo 2>/dev/null
unalias gp 2>/dev/null
unalias gpr 2>/dev/null
unalias grh 2>/dev/null
unalias grs 2>/dev/null
unalias gst 2>/dev/null
unalias gw 2>/dev/null
unalias gwa 2>/dev/null
unalias gwb 2>/dev/null
unalias gwd 2>/dev/null
unalias gwl 2>/dev/null

# Same shortcuts as the Oh My Zsh git plugin.
g() {
  git "$@"
}
gst() {
  git status "$@"
}
glo() {
  git log --oneline --decorate "$@"
}
glg() {
  git log --stat "$@"
}
glgg() {
  git log --graph "$@"
}
gp() {
  git push "$@"
}
gco() {
  git checkout "$@"
}
gcb() {
  git checkout -b "$@"
}

# Create a tag on HEAD and push it.
gt() {
  git tag $1
  git push origin $1
}

# Point a tag at origin/master and force-push it.
gtf() {
  git fetch origin
  git tag -f $1 origin/master
  git push origin $1 --force
}

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
# The current branch name is green; the others are cyan.
gb() {
  git for-each-ref --sort=committerdate --color=auto \
    --format='%(committerdate:relative) %(if:equals=*)%(HEAD)%(then)%(color:bold green)%(else)%(color:cyan)%(end)%(refname:short)%(color:reset)' \
    refs/heads/
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

# Git worktree
gw() {
  git worktree
}
gwa() {
  git worktree add
}
gwb() {
  git worktree add -b
}
gwd() {
  git worktree remove
}
gwl() {
  git worktree list
}
