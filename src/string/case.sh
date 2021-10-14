#!/bin/bash
# -*- coding: utf-8 -*-

###############################################################################
# String padding module
###############################################################################
#
# Defines useful padding functions
#
# Functions:
#   - string::ucase
#   - string::lcase
#
###############################################################################

# Functions

string::ucase() {
  # Convert a string to uppercase
  #
  # Arguments
  #   - string
  #
  # Return values:
  #   - 0   Success
  #   - 1   Incorrect number of arguments
  #
  # Example
  #   string::ucase 'bash'
  #   Output:
  #       'BASH'

  local string="$1"
  local NumberOfArguments="$#"

  if ((NumberOfArguments != 1)); then
    return 1
  fi

  printf "%s" "${string^^}"

  return 0
}

string::lcase() {
  # Convert a string to uppercase
  #
  # Arguments
  #   - string
  #
  # Return values:
  #   - 0   Success
  #   - 1   Incorrect number of arguments
  #
  # Example
  #   string::ucase 'bash'
  #   Output:
  #       'BASH'

  local string="$1"
  local NumberOfArguments="$#"

  if ((NumberOfArguments != 1)); then
    return 1
  fi

  printf "%s" "${string,,}"

  return 0
}