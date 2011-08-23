http://gitref.org/branching

## COMMANDS

show local branches

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
