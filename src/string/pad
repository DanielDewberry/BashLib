#!/bin/bash
# -*- coding: utf-8 -*-

###############################################################################
# String padding module
###############################################################################
#
# Defines useful padding functions
#
# Functions:
#   - string_pad_left     Left pad a string
#   - string_pad_right    Right pad a string
#   - string_pad_outer    Pad a string, surrounding it with the specified
#   - string_pad_inner
#
###############################################################################


# Functions

string_pad_left()
{
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
    #   string_pad_left \
    #      10           \
    #      '-'          \
    #      'Bash'
    #   Output:
    #       '------Bash'

    if (( $# != 3 )); then
        return 1
    fi

    local StringLength="$1"
    local StringPad="$2"
    local String="$3"
    local pad

    if (( ${#String} >= StringLength )); then
        echo "$String"
        return 0
    fi

    pad=$(printf '%*s' "$StringLength")
    pad=${pad// /${StringPad}}

    printf '%*.*s' 0 $((StringLength - ${#String} )) "$pad"
    printf '%s' "$String"
    return 0
}


string_pad_right()
{
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
    #   string_pad_right \
    #      10            \
    #      '-'           \
    #      'Bash'
    #   Output:
    #       'Bash------'

    if (( $# != 3 )); then
        return 1
    fi

    local StringLength="$1"
    local StringPad="$2"
    local String="$3"
    local pad

    if (( ${#String} >= StringLength )); then
        echo "$String"
        return 0
    fi

    pad=$(printf '%*s' "$StringLength")
    pad=${pad// /${StringPad}}

    printf '%s' "$String"
    printf '%*.*s' 0 $((StringLength - ${#String} )) "$pad"
    return 0
}


string_pad_outer()
{
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
    #   string_pad_outer \
    #      10            \
    #      '-'           \
    #      'Bash'
    #   Output:
    #       '---Bash---'

    if (( $# != 3 )); then
        return 1
    fi

    local StringLength="$1"
    local StringPad="$2"
    local String="$3"
    local pad

    if (( ${#String} >= StringLength )); then
        echo "$String"
        return 0
    fi

    pad=$(printf '%*s' "$StringLength")
    pad=${pad// /${StringPad}}

    printf '%*.*s' 0 $(( ( StringLength - ${#String} ) / 2 )) "$pad"
    printf '%s' "$String"
    printf '%*.*s' 0 $(( ( StringLength - ${#String} ) / 2 )) "$pad"
    printf '%*.*s' 0 $(( ( StringLength - ${#String} ) % 2 )) "$pad"
    return 0
}


string_pad_inner()
{
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
    #   string_pad_inner \
    #      10            \
    #      '-'           \
    #      'Bash'        \
    #      'File'
    #   Output:
    #       'Bash--File'

    if (( $# != 4 )); then
        return 1
    fi

    local StringLength="$1"
    local StringPad="$2"
    local LeftString="$3"
    local RightString="$4"
    local pad

    if (( ${#LeftString} + ${#RightString} >= StringLength )); then
        echo "${LeftString}${RightString}"
        return 0
    fi

    pad=$(printf '%*s' "$StringLength")
    pad=${pad// /${StringPad}}

    printf '%s' "$LeftString"
    printf '%*.*s' 0 $(( StringLength - ${#LeftString} - ${#RightString} )) "$pad"
    printf '%s' "$RightString"
    return 0
}

