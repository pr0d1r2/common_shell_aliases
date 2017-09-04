function renice_loop() {
  local renice_loop_LEVEL="-18"
  local renice_loop_INTERVAL="5"
  case $NICE in
    -[1-9] | 1[0-8] | [0-9] | 1[0-9] | 20)
      renice_loop_LEVEL=$NICE
      ;;
  esac
  case $INTERVAL in
    [1-9] | [1-9][0-9] | [1-9][0-9][0-9])
      renice_loop_INTERVAL=$INTERVAL
      ;;
  esac
  while true; do
    sudo echo -n
    parallel \
      "ps -ax | pgrep {} | parallel -I '<>' 'sudo renice $renice_loop_LEVEL <>'" \
      ::: \
      "$@" 2>/dev/null
    sleep "$renice_loop_INTERVAL"
    echo
  done
}
