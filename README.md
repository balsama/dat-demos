# DAT Demo
Demo site.

## Install
```
$ composer quick-start
```

## Development
There are two sqlite databases in the repo: "dev" and "exported". Exported is
the default. If you want to make changes to the exported database, you should
first switch to the dev database using `composer use-dev`. Once you have
everything the way you like, save the changes to the "exported" database by
running:

```$bash
$ composer export-db
```

While working on the dev database, you can reset it to the exported database by
running:

```
$ composer reset-db
```

### List of commands
* `composer use-dev`: Switches to the development database for making changes to
  the default demo site.
* `composer export-db`: Saves the current dev database as the default for new
  demos.
* `composer reset-db`: When working on the dev database, resets it to the
  default.
* `composer use-stable`: Switches from the development database to the default.
* `composer hard-reset`: Recreates the dev database from a fresh config install.
* `composer quite-start`: Installs the site from the stable database.
