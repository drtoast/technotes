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

# get changes from development

    git checkout development
    git rebase development
    git flow feature finish -k "trackerid-description" (merges down to development, keeps branch locally)
    rake spec
    git push origin development
