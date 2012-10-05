http://nvie.com/posts/a-successful-git-branching-model/
http://yakiloo.com/getting-started-git-flow/
http://jeffkreeftmeijer.com/2010/why-arent-you-using-git-flow/

# Install

    brew install git-flow

# Project Setup

    git flow init
    Branch name for production releases: [master]
    Branch name for "next release":  development
    Feature branches: feature/

# Usage

    git flow feature start "trackerid-description"
    *... work on branch, then...*
    git commit -am "This is a useful description [#tracker-id]."
    git checkout development
    git pull
    git checkout "feature/trackerid-..."

# check out a remote branch

    git branch --track feature/14727569-profile_validation origin/feature/14727569-profile_validation
    git checkout feature/14727569-profile_validation

# or, push a local branch to remote

    git push origin feature/13300635-add-markers-to-recs


## A SUCCESSFUL GIT BRANCHING MODEL

http://nvie.com/posts/a-successful-git-branching-model/

Two main branches with infinite lifetime:

    origin/master (HEAD is always at a production-ready state)
    origin/develop (integration branch, automatic nightly builds)
    
    When develop is stable, it is merged into master and tagged for release.

Three types of supporting branches:

    feature
    release
    hotfix
