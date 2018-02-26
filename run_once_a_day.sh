function run_once_a_day() {
  local run_once_a_day_MARKER
  run_once_a_day_MARKER=$(run_once_a_day_marker "$@")
  if [ -e "$run_once_a_day_MARKER" ]; then
    case $(dateh) in
      $(cat "$run_once_a_day_MARKER"))
        return 0
        ;;
    esac
  fi
  # shellcheck disable=SC2068
  $@ || return $?
  dateh > "$run_once_a_day_MARKER" || return $?
}
