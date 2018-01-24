# Attach first detached screen
#
# Example usage:
#   screen_x
function screen_x() {
  # shellcheck disable=SC2046
  screen -x $(screen -list | grep Detached | head -n 1 | cut -f 1 -d '(')
}
