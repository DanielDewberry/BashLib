#! /bin/bash
# -*- coding: utf-8 -*-

requires-root() {
  # Check user has root privileges
  #
  # Returns 0 on success, exit 99 otherwise

  if ((EUID != 0)); then
    echo 'Must run as root' >&2
    exit 99
  fi
  return 0
}