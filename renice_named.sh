function renice_named() {
  local renice_named_LEVEL="-18"
  case $NICE in
    -[1-9] | 1[0-8] | [0-9] | 1[0-9] | 20)
      renice_named_LEVEL=$NICE
      ;;
  esac
  sudo echo -n
  parallel \
    "ps -ax | pgrep {} | cut -b1-5 | parallel -I '<>' 'sudo renice $renice_named_LEVEL <>'" \
    ::: \
    "$@" 2>/dev/null
  return $?
}
