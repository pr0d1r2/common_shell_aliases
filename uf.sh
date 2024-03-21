function uf() {
  SLEEP=1 until_failure $@ || return $?
}
