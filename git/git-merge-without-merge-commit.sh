# E.g. (work done on branch working_branch)
local branch
branch=$(git branch --show-current)
git checkout main
git merge $branch
echo "did you git add, git commit, and git push on ?"
echo "if all looks right, now run git push"
#git push