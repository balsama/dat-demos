#!/bin/sh

which drush
drush --version

site="$1"
target_env="$2"

drush @$site.$target_env tome:install
drush @$site.$target_env user:password admin admin
