http://progit.org/book/
http://gitref.org/

# log

    git log (show log)
    git log -p -2 (show diffs from last 2 commits)
    git log --stat (show files changed and number of lines)
    git log --pretty=format:"%h %s" --graph (show branch/merge graph)

# diff

    git diff (view unstaged changes)
    git diff --cached (view staged changes vs HEAD, aka current branch)
    git diff master..your-branch (view committed changes between master and your branch)
    git diff HEAD (changes in your working dir since last commit)

# branch

    git branch (show branches)
        -r  (remote branches)
        --merged (branches that have already been merged)
        --no-merged (branches that have not been merged)

    git branch my-branch (create this branch from the current branch)
    git branch --track something origin/something (track a remote branch)

# status

    git status (show status of files)

# add

    git add file.txt (stage one file)
    git add . (stage all changed files)

# reset

    git reset HEAD file.txt (unstage file - reset to version in current branch)

# commit

    git commit -m 'your message here' (commit all staged files)
    git commit -a -m 'your message here' (stage and commit all modified files)
    git commit --amend (redo the last commit after adding more files or editing msg)

# rm

    git rm file.txt (remove from tracked files and working directory)
    git rm --cached file.txt (remove from tracked files but NOT from working dir)

# mv

    git mv old_file.txt new_file.txt (rename files)

# checkout

    git checkout -- file.txt (overwrite working file with latest from repository)

# tag

    git tag -a v1.4 -m 'my version 1.4' (make an annotated tag for a version)
    git push origin master --tags (push tags to remote)
    git show v1.4 (show info for that tag)

# clone

    git clone git@github.com:sheetmusicplus/smp.git

# remote

    git remote add origin git@github.com:sheetmusicplus/smp.git
    git remote show origin (show info about remote)
    git branch -r (show remote branches)
    git log origin/master (show remote log)

# fetch

get latest changes from remote and merge into current branch (in two steps)

    git fetch [origin]
    git merge origin/master

# pull

get latest changes from remote and merge into current branch (in one step)

    git pull [origin master]

# config

    git config -l (show configuration)
