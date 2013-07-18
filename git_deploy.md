# Release Process

Our process is heavily based upon the article Git: A Successful Branching Model. Please read the article if you have not yet done so. The one material difference is that we keep a single release branch around indefinitely, rather than creating new ones for every release. The reason is that short-lived branch don't play nice with our build server (a problem actively being worked on).

Some of the following commands could be simplified using git flow.

# Preparing a Release

    git checkout development
    git pull

    git checkout release
    git merge development
    git push origin release

The build server will pick up these changes and kick off a ci and deploy build. If successful, staging will reflect the changes merged from development. The release is ready for QA and stabilization.

# Performing the Release

After the release has been QA'd, it's ready to be merged into master and the bug fixes back into development.

    # While on the release branch
    git pull
     
    # Update master to reflect the release
    git checkout master && git merge origin/master master
    git merge --no-ff release
    git tag release-`date "+%Y%m%d-%H%M%S"`
    git push --tags origin master
     
    # Merge bug fixes back into development
    git checkout development && git merge origin/development development
    git merge --no-ff release
    git push origin development

See Git: A Successful Branching Model for additional discussion and git flow for simplifying some of the commands.

# Deploying to Production

From a machine and account with the correct ssh keys and an up to date clone of the project (e.g. the build server):

    $ cap production deploy:migrations

