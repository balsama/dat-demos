#!/bin/sh

site="$1"
target_env="$2"

which drush
drush --version
/usr/local/bin/drush9  --version
/usr/local/bin/drush9 @$site.$target_env list

echo '--------------------------------';
ls -la
echo '--------------------------------';
ls -la $target_env/
echo '--------------------------------';
ls -la $target_env/livedev
echo '--------------------------------';
ls -la $target_env/livedev/config
echo '--------------------------------';
ls -la $target_env/livedev/config/default
echo '--------------------------------';

/usr/local/bin/drush9 @$site.$target_env tome:install --yes
/usr/local/bin/drush9 @$site.$target_env user:password admin admin
