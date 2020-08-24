function mktemp_executable() {
  local mktemp_executable_NAME
  mktemp_executable_NAME="$(mktemp)" || return $?
  chmod 700 "$mktemp_executable_NAME" || return $?
  echo "$mktemp_executable_NAME" || return $?
}
