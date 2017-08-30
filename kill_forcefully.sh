function kill_forcefully() {
  echorun parallel "kill {}" ::: "$@" 2>/dev/null
  echorun sleep 1
  echorun parallel "kill -9 {}" ::: "$@" 2>/dev/null
}
