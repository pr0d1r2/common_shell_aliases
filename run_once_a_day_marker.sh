function run_once_a_day_marker() {
  run_once_a_day_marker_ID=$(echo "$@" | md5sum | cut -f 1 -d ' ')
  echo "/tmp/.run_once_a_day_marker-$run_once_a_day_marker_ID" || return $?
}
