http://progit.org/book/
http://gitref.org/

# log

    git log (show log)
        -p (show diffs)
        -2 (last 2 commits)
        --stat (show files changed and number of lines)
        --pretty=format:"%h %s"
        --graph (show branch/merge graph)
        --pretty=oneline (show one line per commit)

# diff

    git diff
        -p (show a patch - this is the default)
        --raw (show raw diff)
        --cached (view staged changes vs HEAD, aka current branch)
        --stat (show a diffstat)
        master..your-branch (view committed changes between master and your branch)
        HEAD (changes in your working dir since last commit)

# branch

    git branch (show branches)
        -r  (remote branches)
        -d  (delete branch)
        --merged (show branches that have already been merged)
        --no-merged (show branches that have not been merged)
        --track something origin/something (track a remote branch)
        my-branch (create this branch from the current branch)
    git push origin :my-branch (delete remote branch if it's not present locally)

# status

    git status (show status of files)

# add

    git add
        file.txt (stage one file)
        . (stage all changed files)

# reset

    git reset
        HEAD file.txt (unstage file - reset to version in current branch)
        --hard HEAD (discard all local changes)

# commit

    git commit
        -m 'your message here' (commit all staged files)
        -a -m 'your message here' (stage and commit all modified files)
        --amend (redo the last commit after adding more files or editing msg)

# rm

    git rm
        file.txt (remove from tracked files and working directory)
        --cached file.txt (remove from tracked files but NOT from working dir)

# mv

    git mv old_file.txt new_file.txt (rename files)

# checkout

    git checkout -- file.txt (overwrite working file with latest from repository)

# tag

    git tag
        -a v1.4 -m 'my version 1.4' (make an annotated tag for a version)
        -a v1.2 9fceb02 (tag a specific commit)
        -d v1.2 (delete a tag)
    git push origin master --tags (push tags to remote)
    git show v1.4 (show info for that tag)

# clone

    git clone git@github.com:sheetmusicplus/smp.git

# remote

    git remote
        add origin git@github.com:sheetmusicplus/smp.git
        show origin (show info about remote)
        prune origin (remove deleted remote branches from list)
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
    git config remote.origin.url git@github.com:drtoast/technotes.git (change origin url)
