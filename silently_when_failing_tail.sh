function silently_when_failing_tail() {
  local silently_when_failing_tail_STATUS
  local silently_when_failing_tail_LOG
  silently_when_failing_tail_LOG="/tmp/.silently_when_failing_tail-$$-$(echo "$@" | md5sum | cut -f 1 -d ' ').log"
  # shellcheck disable=SC2068
  ${@:2} &> "$silently_when_failing_tail_LOG"
  silently_when_failing_tail_STATUS=$?
  if [ $silently_when_failing_tail_STATUS -eq 0 ]; then
    tail -n $1 "$silently_when_failing_tail_LOG"
  fi
  rm -f "$silently_when_failing_tail_LOG"
  return $silently_when_failing_tail_STATUS
}
