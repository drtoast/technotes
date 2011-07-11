# book

http://progit.org/book/

# get info

    git branch (show current branches)
    git status (show status of files)
    git diff (view unstaged changes)
    git diff --cached (view staged changes vs HEAD, aka current branch)
    git diff master..your-branch (view committed changes between master and your branch)
    git diff HEAD (changes in your working dir since last commit)
    git log (show log)
    git log -p -2 (show diffs from last 2 commits)
    git log --stat (show files changed and number of lines)
    git log --pretty=format:"%h %s" --graph (show branch/merge graph)

# STAGE

    git add file.txt (stage one file)
    git add . (stage all changed files)
    git reset HEAD file.txt (unstage file - reset to version in current branch)

# COMMIT

    git commit -m 'your message here' (commit all staged files)
    git commit -a -m 'your message here' (stage and commit all modified files)
    git commit --amend (redo the last commit after adding more files or editing msg)

# remove/revert/rename files

    git rm file.txt (remove from tracked files and working directory)
    git rm --cached file.txt (remove from tracked files but NOT from working dir)
    git checkout -- file.txt (overwrite working file with latest from repository)
    git mv old_file.txt new_file.txt (rename files)

# TAGS

    git tag -a v1.4 -m 'my version 1.4' (make an annotated tag for a version)
    git show v1.4 (show info for that tag)
    
push tags to remote

    git push origin master --tags

# BRANCHES

show branches

    git branch
    
show remote branches

    git branch -r

create a branch

    git branch my-branch
    
switch to the branch
    
    git checkout my-branch

delete a branch

    git branch -d my-branch
    
delete a remote branch

    git push origin :my-branch
    
show branches that have already been merged

    git branch --merged

show branches that have not already been merged

    git branch --no-merged
    
create a local branch that tracks a remote branch
    
    git branch --track something origin/something
    
delete a remote branch

# MERGE

get remote changes and merge changes from my-branch back into master

# clone a remote repo:

    git clone git@github.com:sheetmusicplus/smp.git

# add a remote:

    git remote add origin git@github.com:sheetmusicplus/smp.git
    git remote show origin (show info about remote)
    git branch -r (show remote branches)
    git log origin/master (show remote log)

# get latest changes from remote and merge into current branch (in two steps)

    git fetch [origin]
    git merge origin/master

# get latest changes from remote and merge into current branch (in one step)

    git pull [origin master]

# show config:

    git config -l