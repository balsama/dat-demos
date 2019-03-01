#!/usr/bin/env bash

# DESCRIPTION:
# https://github.com/drupal-composer/drupal-project assumes your web-served
# directory is named `web`. But certain hosts (e.g. Acquia) need this directory
# to be named `docroot`. This script will convert the name of the directory to
# `docroot` or any other arbitrary name passed as an argument.
#
# USAGE:
# 1. Copy this file into the repo root of a project created with
#    drupal-composer/drupal-project.
# 2. To convert `web` to `docroot`:
#        ./drupal-project-docroot-convert.sh
#    You can optionally convert `web` to an arbitrary name of your choice by
#    passing an argument to the script. E.g.:
#        ./drupal-project-docroot-convert.sh NAME_OF_DIR
#
# NOTES:
# * This script assumes the current name is `web`, so you won't be able to run
#   it twice on the same project.
# * Any custom modules and themes should be preserved, but use at your own risk.
#   The script will run `composer update` to update the lock file with the new
#   directory names. So if you have specific versions in your lock file, you may
#   lose them. It is best to run this script on a new project before any
#   customizations are made.

read -r -p "This script will rename this project's web directory the directory and will run \`composer update\` to update your lock file.

Do you wish to continue? [Y/n]" response

case $response in
  [yY][eE][sS]|[yY])
    echo "Continuing"
    ;;
  *)
    echo "Aborting"
    exit 1
    ;;
esac

if [ -z "$1" ]
  then
    DIRNAME=docroot
    echo "No directory name supplied, using \`docroot\`."
  else
    DIRNAME=$1
fi

sed -i '' -e "s/web\//${DIRNAME}\//g" ./composer.json ./.gitignore
mv ./web/ "./${DIRNAME}/"

CMD=$(which composer.phar)
if [ "" == "$CMD" ]
  then
    echo "Successfully changed directory, but Composer not found. Run \`composer update\` manually."
  else
    composer.phar update
    echo "Successfully changed directory and updated your lock file."
fi
