#!/usr/bin/env bash
set -e # halt script on error

SOURCE_BRANCH="master"
TARGET_BRANCH="gh-pages"

# Save some useful information
REPO=`git config remote.origin.url`
SSH_REPO=${REPO/https:\/\/github.com\//git@github.com:}
SHA=`git rev-parse --verify HEAD`
cd ..
BASEDIR=`echo $(pwd)`

# Clone the existing gh-pages for this repo into out/
# Create a new empty branch if gh-pages doesn't exist yet (should only happen on first deply)
git clone $REPO out

echo $(pwd)
ls -all

cd out
git checkout $TARGET_BRANCH || git checkout --orphan $TARGET_BRANCH
echo "content after checkout"
echo $(pwd)
ls -all

# Clean out existing contents
# rm -rf out/**/* || exit 0

git rm -rf .
git clean -fxd
echo "content after clean"
echo $(pwd)
ls -all

# Now let's go have some fun with the cloned repo
git config user.name "Travis CI"
git config user.email "$COMMIT_AUTHOR_EMAIL"

cp -r $BASEDIR/jekyll-site/content/_site/* $BASEDIR/out
echo "content after copy"
echo $(pwd)
ls -all


# If there are no changes to the compiled out (e.g. this is a README update) then just bail.
if [ -z `git diff --exit-code` ]; then
    echo "No changes to the output on this push; exiting."
    exit 0
fi

# Commit the "changes", i.e. the new version.
# The delta will show diffs between new and old versions.
git add .
git commit -m "Deploy to GitHub Pages: ${SHA}"

echo "all files added"
echo $(pwd)
echo ls -all

echo "switch to original to add the key"
cd $BASEDIR/jekyll-site/settings/keys

# Get the deploy key by using Travis's stored variables to decrypt deploy_key.enc
ENCRYPTED_KEY_VAR="encrypted_${ENCRYPTION_LABEL}_key"
ENCRYPTED_IV_VAR="encrypted_${ENCRYPTION_LABEL}_iv"
ENCRYPTED_KEY=${!ENCRYPTED_KEY_VAR}
ENCRYPTED_IV=${!ENCRYPTED_IV_VAR}
openssl aes-256-cbc -K $ENCRYPTED_KEY -iv $ENCRYPTED_IV -in deploy_key.enc -out deploy_key -d
chmod 600 deploy_key
eval `ssh-agent -s`
ssh-add deploy_key

echo "switch back ..."
cd $BASEDIR/out
echo $(pwd)
echo ls -all

# Now that we're all set up, we can push.
git push $SSH_REPO $TARGET_BRANCH
