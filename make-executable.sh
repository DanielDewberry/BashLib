#!/bin/bash
# -*- coding: utf-8 -*-

find src tests -type f -not -name '*swp' -exec chmod 754 {} \;

