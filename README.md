phpcs-ds-pre-commit
=======================

Provides all necessary dependencies for PHP code sniffer with Drupal standards

TODO:
--------
- Add js, css checkers
- Extend package functionality to use more Drupal 8 versions(at least all supported)
- More to go....


Installation
-----------------------

TODO: update Readme file to use recent versions of packages.

update your `composer.json` by adding the code below to `repositories` property of your `composer.json`

        {
            "type": "vcs",
            "url": "git@github.com:KupnoH/pre-commit-linter.git",
            "options": {
                "ssh2": {
                    "pubkey_file": "./ssh_keys/phpcs_ds.pub",
                    "privkey_file": "./ssh_keys/phpcs_ds"
                }
            }
        }

add `scripts` property to your `composer.json` file and paste the script below:


    "scripts": {
      "setup-linters": [
        "sh ./path/to/setup.sh"
      ]
    },

Unfortunately composer does not allow execution of any scripts from not root-package (@see https://getcomposer.org/doc/articles/scripts.md#what-is-a-script-), but maybe in future we will find a workaround for it, who knows.

after executing the steps above run the command below:

`composer require --dev KupnoH/pre-commit-linter`

This command will install package `KupnoH/pre-commit-linter` from repository `git@github.com:KupnoH/pre-commit-linter.git` and all the necessary dependencies.

To correctly handle pre-commits you should execute script `setup-linters`, added above. To execute it run the command below:

`composer run-script setup-linters`

It will create a `pre-commit` file in directory `.git/hooks` with all the necessary commands to execute.

How to use
-----------------

Usage of it is very simple. You do not have to actually do anything. All scripts will work without your interaction and will run when one will try to use `git commit` command. Your code will be checked against coding standards, best practices and language violations and you will see success or error message in different cases.

For more info on _how-to-use_ please go **_@see_ phpcs-ds-pre-commit/scripts/README.md** (how to use section) 

NOTES
--------
for twig lint used https://github.com/asm89/twig-lint


ENJOY!
