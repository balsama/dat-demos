#!/bin/bash

chmod -R +w docroot/sites/default
cp docroot/sites/default/default.settings.php docroot/sites/default/settings.php
echo "if (file_exists('/var/www/site-php')) { require '/var/www/site-php/datdemos/datdemos-settings.inc';}" >> docroot/sites/default/settings.php
