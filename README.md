# DAT Demo
Demo site.

## Local Quick Start
```
$ composer quick-start
```
This will install composer dependencies, install the Standard Drupal profile
using a local sqlite database, and start a webserver/open a browser. Use `admin`
/`admin` to log in.

When a commit is made, Pipelines job is triggered which:

1. Follows the instructions in `acquia-pipelines.yml` file in this repo.
2. Commits the result to the Cloud repo as `[branch-name]-pipelines-build`.
 