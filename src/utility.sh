#! /bin/bash
# -*- coding: utf-8 -*-

requires-root() {
  # Check user has root privileges
  #
  # Returns 0 on success, exit 99 otherwise

  if ((EUID != 0)); then
    printf 'Must run as root\n' >&2
    exit 99
  fi
  return 0
}
