function echorun() {
  echo "$@"
  $@ || return $?
}
