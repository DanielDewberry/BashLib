#!/bin/bash
# -*- coding: utf-8 -*-

repeat() {
  # Repeat character or string, optionally separated by another sequence
  #
  # Arguments:
  #   - char
  #   - repeats
  #   - separator
  #
  # Example:
  #   repeat 3 'x'
  #   repeat 3 'x'  'y'
  #   repeat 3 'xx' 'yy'

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