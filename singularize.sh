function singularize() {
  active_support_inflector singularize "$@" || return $?
}
