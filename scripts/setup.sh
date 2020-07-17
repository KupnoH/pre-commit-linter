#!/bin/sh

## Set proper site UUID
#-drush --root=docroot/ -y cset system.site uuid a638feda-1543-47ed-8253-80fbd690e315

### Create Codesniffer symlink ###
# Target file.
TARGET=../../../../../drupal/coder/coder_sniffer/Drupal
TARGET_DP=../../../../../drupal/coder/coder_sniffer/DrupalPractice
# Link name.
LINK_NAME=vendor/squizlabs/php_codesniffer/src/Standards/Drupal
LINK_NAME_DP=vendor/squizlabs/php_codesniffer/src/Standards/DrupalPractice
# Link folder.
LINK_FOLDER=vendor/squizlabs/php_codesniffer
PACKAGE_FOLDER=vendor/ailyin/pre-commit-linter

if [ -d "$LINK_FOLDER" ]; then
  # Create symlink Drupal standard.
  ln -sf ${TARGET} ${LINK_NAME}

  # Creates symlink to DrupalPractice.
  ln -sf ${TARGET_DP} ${LINK_NAME_DP}

  # Pre commit hook
  cp $PACKAGE_FOLDER/scripts/pre-commit .git/hooks/pre-commit
  # Make files executable.
  chmod +x .git/hooks/pre-commit

fi
### End Create symlink ####
