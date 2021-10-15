#!/bin/bash
# -*- coding: utf-8 -*-

###############################################################################
# String  module
###############################################################################
#
# Defines useful string functions
#
# Functions:
#   - string::ucase        Convert a string to upper case
#   - string::lcase        Convert a string to lower case
#   - string::pad_left     Left pad a string
#   - string::pad_right    Right pad a string
#   - string::pad_outer    Pad a string, surrounding it with the specified
#   - string::pad_inner    Insert specified character between two strings until
#                          the total string length reaches the chosen length
#   - string::repeat       Repeat a string n times
#   - string::ltrim        Remove leading whitespace from a string
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

string::pad_left() {
  # Left pad a string
  #
  # Arguments
  #   - length        Maximum string length
  #   - padding       String to use as padding
  #   - string        The string to pad
  #
  # Return values:
  #   - 0   Success
  #   - 1   Incorrect number of arguments
  #
  # Example
  #   string::pad_left \
  #      10           \
  #      '-'          \
  #      'Bash'
  #   Output:
  #       '------Bash'

  if (($# != 3)); then
    return 1
  fi

  local StringLength="$1"
  local StringPad="$2"
  local String="$3"
  local pad

  if ((${#String} >= StringLength)); then
    printf '%s\n' "${String}"
    return 0
  fi

  pad=$(printf '%*s' "$StringLength")
  pad=${pad// /${StringPad}}

  printf '%*.*s' 0 $((StringLength - ${#String})) "$pad"
  printf '%s' "$String"
  return 0
}

string::pad_right() {
  # Right pad a string
  #
  # Arguments
  #   - length        Maximum string length
  #   - padding       String to use as padding
  #   - string        The string to pad
  #
  # Return values:
  #   - 0   Success
  #   - 1   Incorrect number of arguments
  #
  # Example
  #   string::pad_right \
  #      10            \
  #      '-'           \
  #      'Bash'
  #   Output:
  #       'Bash------'

  if (($# != 3)); then
    return 1
  fi

  local StringLength="$1"
  local StringPad="$2"
  local String="$3"
  local pad

  if ((${#String} >= StringLength)); then
    printf '%s\n' "${String}"
    return 0
  fi

  pad=$(printf '%*s' "$StringLength")
  pad=${pad// /${StringPad}}

  printf '%s' "$String"
  printf '%*.*s' 0 $((StringLength - ${#String})) "$pad"
  return 0
}

string::pad_outer() {
  # Outer pad a string
  #
  # Arguments
  #   - length        Maximum string length
  #   - padding       String to use as padding
  #   - string        The string to pad
  #
  # Return values:
  #   - 0   Success
  #   - 1   Incorrect number of arguments
  #
  # Example
  #   string::pad_outer \
  #      10            \
  #      '-'           \
  #      'Bash'
  #   Output:
  #       '---Bash---'

  if (($# != 3)); then
    return 1
  fi

  local StringLength="$1"
  local StringPad="$2"
  local String="$3"
  local pad

  if ((${#String} >= StringLength)); then
    printf '%s\n' "$String"
    return 0
  fi

  pad=$(printf '%*s' "$StringLength")
  pad=${pad// /${StringPad}}

  printf '%*.*s' 0 $(((StringLength - ${#String}) / 2)) "$pad"
  printf '%s' "$String"
  printf '%*.*s' 0 $(((StringLength - ${#String}) / 2)) "$pad"
  printf '%*.*s' 0 $(((StringLength - ${#String}) % 2)) "$pad"
  return 0
}

string::pad_inner() {
  # Inner pad a string
  #
  # Arguments
  #   - length        Maximum string length
  #   - padding       String to use as padding
  #   - left_string   The string  on the left of padding
  #   - right_string  The string  on the right of padding
  #
  # Return values:
  #   - 0   Success
  #   - 1   Incorrect number of arguments
  #
  # Example
  #   string::pad_inner \
  #      10            \
  #      '-'           \
  #      'Bash'        \
  #      'File'
  #   Output:
  #       'Bash--File'

  if (($# != 4)); then
    return 1
  fi

  local StringLength="$1"
  local StringPad="$2"
  local LeftString="$3"
  local RightString="$4"
  local pad

  if ((${#LeftString} + ${#RightString} >= StringLength)); then
    printf '%s%s\n' "${LeftString}" "${RightString}"
    return 0
  fi

  pad=$(printf '%*s' "$StringLength")
  pad=${pad// /${StringPad}}

  printf '%s' "$LeftString"
  printf '%*.*s' 0 $((StringLength - ${#LeftString} - ${#RightString})) "$pad"
  printf '%s' "$RightString"
  return 0
}

string::repeat() {
  # Repeat character or string, optionally separated by another sequence
  #
  # Arguments:
  #   - char
  #   - repeats
  #   - separator
  #
  # Example:
  #   string::repeat 3 'x'
  #   string::repeat 3 'x'  'y'
  #   string::repeat 3 'xx' 'yy'

  local Occurences="$1"
  local String="$2"
  local Separator="$3"

  if ((Occurences == 0)); then
    return
  fi

  ((--Occurences))
  printf '%s' "$String"
  for ((i = 0; i < Occurences; i++)); do
    printf '%s%s' "${Separator}" "${String}"
  done
  return 0
}

string::ltrim() {
  # Trim leading space
  #
  # Arguments:
  #   - string
  #
  # Example:
  #   string::ltrim '  leading space'

  local var
  var="$1"
  var="${var#"${var%%[![:space:]]*}"}"
  printf '%s' "${var}"
  return
}
