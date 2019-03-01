#!/bin/sh

which drush
drush --version

site="$1"
target_env="$2"

./vendor/bin/drush @$site.$target_env tome:install
./vendor/bin/drush @$site.$target_env user:password admin admin
