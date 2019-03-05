#!/bin/sh

site="$1"
target_env="$2"

which drush
drush --version
/usr/local/bin/drush9  --version
/usr/local/bin/drush9 @$site.$target_env list

/usr/local/bin/drush9 @$site.$target_env tome:install --yes
/usr/local/bin/drush9 @$site.$target_env user:password admin admin
