### Git Rebase

# Assumptions: Remote working branch is already in rebase hell, where it shows a huge number of commits and changes... 
git checkout <commit-hash> # commit where you actually want to rebase on
git switch -c <feature-branch> #this branch already existing in remote but re-create it locally anyway
git fetch origin
git rebase main
git add .; git commit -m "Commit message"
git push --force-with-lease origin <feature-branch>


# Assumptions: Remote working branch is not in rebase hell, but many commits behind main
git fetch origin
git rebase main
# VS Code: Source Control > Merge Changes > fix, save > Click + (Stage Changes)
git rebase --continue
git add <file>
# Keep running git rebase --continue until all conflicts resolved
git add .; git commit -m "Commit message"
git push --force-with-lease origin <feature-branch>