function silently_when_failing() {
  local silently_when_failing_STATUS
  local silently_when_failing_LOG
  silently_when_failing_LOG="/tmp/.silently_when_failing-$$-$(echo "$@" | md5sum | cut -f 1 -d ' ').log"
  # shellcheck disable=SC2068
  $@ &> "$silently_when_failing_LOG"
  silently_when_failing_STATUS=$?
  if [ $silently_when_failing_STATUS -eq 0 ]; then
    cat "$silently_when_failing_LOG"
  fi
  rm -f "$silently_when_failing_LOG"
  return $silently_when_failing_STATUS
}
