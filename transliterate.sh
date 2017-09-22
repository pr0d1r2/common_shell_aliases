function transliterate() {
  active_support_inflector transliterate "$@" || return $?
}
