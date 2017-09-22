function humanize() {
  active_support_inflector humanize "$@" || return $?
}
