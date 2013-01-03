# Keyboard Shortcuts

Navigation

* focus command bar (s)
* help (?)


Source code

* file finder (t)
* jump to line (l)
* switch branch/tag (w)


## Set up git

git config --global user.name "drtoast"
git config --global user.email "toast@drtoast.com"

// generate a public key in ~/.ssh and add to https://github.com/account
ssh-keygen -t rsa -C "toast@drtoast.com"


## Create a new project

click "create repository" at http://github.com/repositories/new, then

    mkdir dotfiles
    cd dotfiles
    git init
    emacs README.md
    git add README.md
    git commit -m 'first commit'
    git remote add origin git@github.com:drtoast/dotfiles.git
    git push origin master

## Push an existing local repo into github

    cd yourproject
    git remote add origin git@github.com:drtoast/yourproject.git
    git push origin master

## Pull changes to a forked branch

    http://www.eqqon.com/index.php/Collaborative_Github_Workflow

## show remotes:

    git remote -v

## add a remote:

    git remote add mattetti git://github.com/mattetti/macruby_graphics.git

## pull from a remote:

    git pull origin master (from my repo)
    git pull mattetti master (from his repo)

## Show local tags

    git tag

## Tag a release

    git tag -a v0.0.2 -m 'tagging release v0.0.2'
    git push origin master --tags
