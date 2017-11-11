function shellcheck_all() {
  if [ -n "$1" ]; then
    parallel \
      "find {} -type f -name '*.sh'" \
      ::: \
      "$@" \
        | parallel shellcheck
  else
    find . -type f -name '*.sh' | parallel shellcheck
  fi
  return $?
}
