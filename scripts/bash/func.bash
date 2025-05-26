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

function cbuild {
  local build_use_thread=$(( `nproc` / 2 + 1))
  if command -v cmake &> /dev/null; then
    if [ -f "CMakeLists.txt" ]; then
      cmake \
        -S . \
        -B build \
        -D CMKAE_BUILD_TYPE=RelWithDebInfo \
        -D CMAKE_EXPORT_COMPILE_COMMANDS=ON
    fi
    if [ -f "build/CMakeCache.txt" ]; then
      cmake --build build -j $build_use_thread
    fi
  elif command -v make &> /dev/null; then
    if [ -f "Makefile" ]; then
      make -j $build_use_thread
    fi
  fi
}
