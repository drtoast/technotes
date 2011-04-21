## to checkout a project 

    cd ~/oboe
    svn co svn+ssh://you@test.com/usr/local/svn/oboe/trunk

## to show list of changed files in local copy

    svn status

## to show diff between working copy and what you got from repository

    svn diff

## to show diff between working copy and a specific version in the repository

    svn diff -r 9

## to show diff between working copy and the most recent repository version

    svn diff -r HEAD

## to commit changes to repository

    svn commit -m "added blah to kj copy"

## to update local copy with any changes from repository

    svn up

## to show log of prior changes

    svn log
    svn log -v (show affected paths)
    svn log --stop-on-copy (don't show entries from before files were copied)

## to show help

    svn help [command]

## to revert local copy to the current version in repository

    svn revert [filename.txt]

## to revert local copy to the specified revision number
    
    svn update -r 2 [filename.txt]

## to add/copy/move/delete a file to repository

    svn [add|copy|move|delete] filename.txt

