function progress_bar {
    local i="$1"  # index
    local max="$2"  # max index
    local max_bar_len=80
    if [ $i -lt 1 ] || [ $i -gt $max ]
    then
        return
    fi
    local index=$(($max_bar_len * $i / $max))
    local progress="`yes '#' | head -n $index | tr -d '\n'`"
    local remainder="`yes ' ' | head -n $(($max_bar_len - $index)) | tr -d '\n'`"
    local status="`printf %${#max}d/%${#max}d $i $max`"
    printf "\r(%s)[%s]" "$status" "${progress}${remainder}"
    if [[ $max == $i ]]
    then
        printf "\n"
    fi
}
