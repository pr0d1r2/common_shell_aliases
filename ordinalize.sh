function ordinalize() {
  active_support_inflector ordinalize "$@" || return $?
}
