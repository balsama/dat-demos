#!/bin/sh

which drush
drush --version

site="$1"
target_env="$2"

/usr/local/bin/drush9 @$site.$target_env tome:install
/usr/local/bin/drush9 @$site.$target_env user:password admin admin
