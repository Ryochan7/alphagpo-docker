#!/bin/bash

function help {
  echo "Available commands:"
  for i in ./scripts/commands/*; do
    printf "\t$(basename $i)\n"
  done
}

function validate_command {
  if [[ ! -f ./scripts/commands/$1 ]]; then
    echo "Command '$1' not found"
    help
    exit 1
  fi
}

# Run the given command or show help.
if [[ $# == 0 ]]; then
  help
else
  COMMAND="$1"
  validate_command "$COMMAND"
  # Remove the command from the argument list since individual commands don't
  # need to know their own name.
  shift

  echo "Running command '$COMMAND'"
  source "./scripts/commands/$COMMAND"
  echo "Done running command '$COMMAND'"
fi
