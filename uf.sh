function uf() {
  SLEEP=0 until_failure $@ || return $?
}
