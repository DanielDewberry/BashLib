#!/bin/bash
# -*- coding: utf-8 -*-

###############################################################################
# Logging module
###############################################################################
#
# Defines useful logging functions
#
# Functions:
#   - echo_logging   Implements the underlying logging mechanism
#   - echo_info      Proxy for echo_logging INFO    "$@"
#   - echo_warn      Proxy for echo_logging WARNING "$@"
#   - echo_err       Proxy for echo_logging ERROR   "$@"
#
###############################################################################

echo_logging() {
  # Implements the info, warn and error logging
  #
  # Arguments:
  #   - level
  #   - message

  local LoggingLevel="$1"
  shift
  local LoggingMessage="$*"

  if [[ $# == 0 ]]; then
    echo "$(date -Is) $LoggingLevel" >&2
  else
    echo "$(date -Is) $LoggingLevel $LoggingMessage" >&2
  fi
  return 0
}

echo_info() {
  # Print information level logging message to stderr
  #
  # Arguments:
  #   - message

  echo_logging "INFO" "$@" >&2
  return 0
}

echo_warn() {
  # Print warning level logging message to stderr
  #
  # Arguments:
  #   - message

  echo_logging "WARNING" "$@" >&2
  return 0
}

echo_err() {
  # Print error level logging message to stderr
  #
  # Arguments:
  #   - message

  echo_logging "ERROR" "$@" >&2
  return 0
}

# echo "PID  $BASHPID"
# echo "PPID $PPID"
# echo "UID  $UID"
# echo "EUID $UID"