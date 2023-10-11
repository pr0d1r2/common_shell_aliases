function us() {
  SLEEP=0 until_success $@ || return $?
}
