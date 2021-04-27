repeat()
{
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

    if (( Occurences == 0 )); then
        echo  ''
    elif (( Occurences == 1 )); then
        echo 'x'
    else
        printf "$String"
        printf "${Separator}${String}"'%.s' $(seq 1 "$(( --Occurences ))" )
    fi
    return 0
}

