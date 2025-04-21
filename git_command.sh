git merge branchName
git merge --squash branchName
git push 

git rebase branchName
git rebase --continue

git reset --soft HEAD~1 (soft, mixed reset, hard) - soft -move commits to staged area | mixed reset - unstage area | hard - remove changes clean history

merge creates a more complex commit history with merge commits.
rebase keeps the history linear and cleaner.
rebase: Rewrites history by moving or applying commits on top of another branch.

git stash save "My changes to feature X"
git stash list
git stash apply stash@{0} | git stash pop stash@{0} [apply will not remove stash from stash list and vise versa]
git stash drop stash@{0} | git stash clear
git stash --staged [Stash Only Staged Changes]
git stash -u

git cherry-pick <commit-hash>
git cherry-pick <commit-hash1>^..<commit-hash2>
git cherry-pick --continue
git cherry-pick --edit <commit-hash>  --- edit commit message