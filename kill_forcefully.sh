function kill_forcefully() {
  test -n "$1" || return 0
  parallel "kill {}" ::: "$@" 2>/dev/null
  sleep 1
  parallel "kill -9 {}" ::: "$@" 2>/dev/null
}
