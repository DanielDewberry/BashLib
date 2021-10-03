#!/bin/bash
# -*- coding: utf-8 -*-

runner() {
  printf '\033[36mInvoking:\033[0m %s\n' "$*"
  printf '\033[36m  Output:\033[0m '
  "$@"
  echo $'\n'
}
