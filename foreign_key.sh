function foreign_key() {
  active_support_inflector foreign_key "$@" || return $?
}
