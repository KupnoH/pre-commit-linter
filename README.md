phpcs-ds-pre-commit
=======================

Provides all necessary dependencies for PHP code sniffer with Drupal standards and twig linter

TODO:
--------
- Add js, css checkers
- Extend package functionality to use more Drupal 8 versions(at least all supported)
- Add functionality for custom installation
- Add security check package
- More to go....


Installation
-----------------------

TODO: update Readme file to use recent versions of packages.

First of all install `neronmoon/scriptsdev` package.

Update your `composer.json` by adding the code below to `repositories` property of your `composer.json`

        {
            "type": "vcs",
            "url": "git@github.com:KupnoH/pre-commit-linter.git",
        }

add `scripts-dev` property to your `composer.json` file and paste the script below:


    "scripts-dev": {
        "post-install-cmd": [
            "sh ./vendor/ailyin/pre-commit-linter/scripts/setup.sh"
        ]
    },

This command will run after composer install command and install all necessary scripts.

after executing the steps above run the command below:

`composer require --dev ailyin/pre-commit-linter`

If you are experiencing problems with path(OS Windows(TODO: add explanations here)) use the following command(It will install package from branch `da_issue`:

`composer require --dev ailyin/pre-commit-linter:dev-da_issue`

This command will install package `ailyin/pre-commit-linter` from repository `git@github.com:KupnoH/pre-commit-linter.git` and all the necessary dependencies.


How to use
-----------------

Usage of it is very simple. You do not have to actually do anything. All scripts will work without your interaction and will run when one will try to use `git commit` command. Your code will be checked against coding standards, best practices and language violations and you will see success or error message in different cases.

For more info on _how-to-use_ please go **_@see_ phpcs-ds-pre-commit/scripts/README.md** (how to use section) 

NOTES
--------
for twig lint used https://github.com/asm89/twig-lint


ENJOY!
