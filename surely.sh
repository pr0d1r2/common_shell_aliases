function surely() {
  ATTEMPTS=1000000 until_success "$@" || return $?
}
