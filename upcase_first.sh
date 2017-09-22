function upcase_first() {
  active_support_inflector upcase_first "$@" || return $?
}
