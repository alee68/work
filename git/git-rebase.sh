### Git Rebase
# Assumptions: Feature branch is "fbranch"; assume remote fbranch is already in rebase hell, where it shows a huge number of commits and changes... 

git checkout <commit-hash> # commit where you actually want to rebase on
git switch -c fbranch #this branch already existing in remote but re-create it locally anyway
git fetch origin
git rebase main
git add .; git commit -m "Commit message"
git push --force-with-lease origin fbranch