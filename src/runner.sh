#!/bin/bash
# -*- coding: utf-8 -*-

runner()
{
    echo -e  "\033[36mInvoking:\033[0m $*"
    echo -ne "\033[36m  Output:\033[0m "
    "$@"
    echo $'\n'
}
