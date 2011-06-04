http://yakiloo.com/getting-started-git-flow/
http://jeffkreeftmeijer.com/2010/why-arent-you-using-git-flow/

# Install

brew install git-flow

# Project Setup

git flow init
Branch name for "next release":  development
Feature branches: feature/

# Usage

git flow feature start "trackerid-description"
*... work on branch, then...*
git commit -am "This is a useful description [#tracker-id]."
git checkout development
git pull origin development
git checkout "feature/trackerid-..."
git rebase -i development
git flow feature finish -k "trackerid-description" (merges down to development, keeps branch locally)
rake spec
git push origin development
