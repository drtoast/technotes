# Assumptions

"github" and "heroku" remotes setup as follows:

  git remote add github git@github.com:your-company/your-repo.git
  git remote add heroku git@heroku.com:your-heroku-app.git

Your .gitconfig is set to automatically rebase on pull:

  [branch]
    autosetuprebase = always

# Checkout the "develop" branch and create a new feature branch including the tracker ID

    git checkout develop
    git checkout -b 'features/my-new-feature-12345'

# Work on your branch, periodically committing and rebasing on develop

    git commit -am 'Added some changes'
    git checkout develop
    git pull
    git checkout features/my-new-feature-12345
    git rebase develop

# When done, push your branch to Github and create a pull request

    git checkout features/my-new-feature-12345
    git push github features/my-new-feature-12345

# Optionally respond to any pull request feedback, and push again to Github

    git commit -am 'Responded to feedback'
    git push github features/my-new-feature-12345

# When everything looks good, merge the pull request at Github, OR:

    git checkout develop
    git merge --no-ff features/my-new-feature-12345
    git push github develop

# To deploy, merge develop into master and push to Heroku:

    git checkout master
    git merge develop
    git push origin heroku
