function us() {
  SLEEP=1 until_success $@ || return $?
}
