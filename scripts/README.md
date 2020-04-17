Hook pre-commit with phpcs with Drupal coding standards.
=====================

**_OUTDATED_**, but still can be used to setup phpcs check.

how to install
---------

First of all place files into project directory under `scripts/tools`

Then:

- locate bin directory in your project. By default it is in `vendor/` directory
- choose correct value for `PHPCS_PATH` variable in  `pre-commit` file(if you have `bin-dir` option in your `composer.json` file use it if not - look for advice in `pre-commit` file comments)
- add the code below to your `composer.json`:


    "scripts-dev": {
        "post-install-cmd": [
            "sh ./scripts/tools/setup.sh"
        ]
    },
It will execute all the steps necessary to setup hook pre-commit

- paste require-dev packages below to your `composer.json` file and execute `composer install`
    
    
    "require-dev": {
        "squizlabs/php_codesniffer": "2.*",
        "dealerdirect/phpcodesniffer-composer-installer": "^0.5.0",
        "neronmoon/scriptsdev": "^0.1.6",
        "drupal/coder": "8.*"
    }

or execute the commands:

`composer require --dev squizlabs/php_codesniffer:2.*`

`composer require --dev drupal/coder:8.*`

`composer require --dev neronmoon/scriptsdev`

`composer require --dev dealerdirect/phpcodesniffer-composer-installer`

how to use
----------

To use phpcs pre-commit with drupal standards run composer install(if it wasn't run before) to let post-install-cmd execute all it's stuff
to be sure check `.git/hooks/` directory and try to find `pre-commit` file. If it's there everything went OK and all set up.

Now make some changes in your code, add them to git and run `git commit` command

At first the command tries to detect any syntax errors in your code.

If no errors found you will  see something like this:

    Checking PHP Lint...
    No syntax errors detected in /path/to/your/project/and/file/that/was/added.php
    Running Code Sniffer...(omits warnings)

if there are some errors you will see message with error and where to find it(just like in browser)

then script checks coding standards

in case of any error output will look like this:

    FILE: /path/to/your/project/and/file/that/was/added.php
    ----------------------------------------------------------------------
    FOUND 8 ERRORS AFFECTING 8 LINES
    ----------------------------------------------------------------------
     13 | ERROR | [x] Missing class doc comment
     15 | ERROR | [ ] Missing short description in doc comment
     18 | ERROR | [ ] Class property $not_lower_camel should use lowerCamel
        |       |     naming without underscores
     20 | ERROR | [ ] Missing short description in doc comment
     25 | ERROR | [x] Missing function doc comment
     43 | ERROR | [ ] Missing parameter comment
     45 | ERROR | [ ] Description for the @return value is missing
     46 | ERROR | [x] Separate the @return and @throws sections by a
        |       |     blank line.
    ----------------------------------------------------------------------
    PHPCBF CAN FIX THE 3 MARKED SNIFF VIOLATIONS AUTOMATICALLY
    ----------------------------------------------------------------------
    
    Time: 72ms; Memory: 8Mb
    
    Fix the error before commit.


In case of success you will see:

    Running Code Sniffer...(omits warnings)
    .
    
    Time: 80ms; Memory: 8Mb
    
    Running CS Drupal Best Practices...(includes warnings)
    .
    
    Time: 25ms; Memory: 6Mb
    
    [phplint_test--develop 1afc1ec] test commit
     2 files changed, 23 insertions(+), 11129 deletions(-)
     delete mode 100644 composer.lock
     
 
 Necessary notes
 ----------------
 
 if you place `setup.sh` file to the other directory, you should change scripts-dev and show where it is.
 
 If you place `pre-commit` file in other directory(not `scripts/tools`) you should change the path to it in `setup.sh` file on line 24:
 
  `cp path/to/your/pre-commit .git/hooks/pre-commit`
 
 
 ENJOY!
