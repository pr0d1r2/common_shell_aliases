# Wait until first ping from Google DNS returns and run the command
#
# Example usage:
#   when_online git push
function when_online() {
  local when_online_SLEEP
  case "$SLEEP" in
    "")
      when_online_SLEEP=5
      ;;
    [0-9] | [1-9][0-9] | [1-9][0-9][0-9] | [1-9][0-9][0-9][0-9])
      when_online_SLEEP="$SLEEP"
      ;;
  esac
  local when_online_ADDRESS
  case "$ADDRESS" in
    "")
      when_online_ADDRESS="8.8.8.8"
      ;;
    *.*)
      when_online_ADDRESS="$ADDRESS"
      ;;
  esac

  SLEEP="$when_online_SLEEP" until_success ping -c 1 "$when_online_ADDRESS" && "$@"
  return $?
}
