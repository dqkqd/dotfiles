push:
  git checkout main
  git push --force
  git checkout light
  git push --force
  git checkout dark
  git push --force
  git checkout main

rebase:
  git checkout light
  git rebase main
  git checkout dark
  git rebase main
  git checkout main

