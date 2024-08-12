#!/usr/bin/bash

git="git -C $HOME/dotfiles"
current_branch=$($git rev-parse --abbrev-ref HEAD)

exitscript() {
  ppid=$(ps -o ppid= -p $$)
  kill -SIGKILL $ppid
}

if [ -n "$($git status --porcelain)" ]; then
  echo "There are changes in dotfiles. Abort"
elif [[ "$current_branch" != "light" ]]; then
  $git checkout light >/dev/null 2>&1
  exitscript
elif [[ "$current_branch" != "dark" ]]; then
  $git checkout dark >/dev/null 2>&1
  exitscript
fi
