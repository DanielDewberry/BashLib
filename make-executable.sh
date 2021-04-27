#!/bin/bash
# -*- coding: utf-8 -*-

find                  \
    tests             \
    examples          \
    -type f           \
    -not -name '*swp' \
    -exec chmod 754 {} \;

