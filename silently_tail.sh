function silently_tail() {
  local silently_tail_STATUS
  local silently_tail_LOG
  silently_tail_LOG="/tmp/.silently_tail-$$-$(echo "$@" | md5sum | cut -f 1 -d ' ').log"
  # shellcheck disable=SC2068
  ${@:2} &> "$silently_tail_LOG"
  silently_tail_STATUS=$?
  if [ $silently_tail_STATUS -gt 0 ]; then
    tail -n $1 "$silently_tail_LOG"
  fi
  rm -f "$silently_tail_LOG"
  return $silently_tail_STATUS
}
