function pluralize() {
  active_support_inflector pluralize "$@" || return $?
}
