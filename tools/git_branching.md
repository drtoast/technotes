http://gitref.org/branching

# LIST

    git branch
        -r  [remote branches]
        --merged [branches that have already been merged]
        --no-merged [branches that have not been merged]


# CREATE

    git branch
        my-branch [create this branch]
        --track something origin/something [track a remote branch]

switch to the branch
    
    git checkout my-branch


# DELETE

delete a branch

    git branch -d my-branch
    
delete a remote branch

    git push origin :my-branch
