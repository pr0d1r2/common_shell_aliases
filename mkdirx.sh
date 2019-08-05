function mkdirx() {
  local mkdirx_DIR="$(echo "$@" | tr ' ' '_' | tr '[A-Z]' '[a-z]' | tr '[:;,.]' '_')"
  mkdir "$mkdirx_DIR" || return $?
  cd "$mkdirx_DIR" || return $?
}
