function zero_dir() {
  if [ -d "$1" ]; then
    rm -rf "$1" || return $?
    mkdir "$1" || return $?
  fi
}
