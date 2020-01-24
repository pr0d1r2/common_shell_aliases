# Allow to quickly stop fork bomb caused by GNU parallel
#
# Example usage:
#   parallel_fork_bomb_stop
function parallel_fork_bomb_stop() {
  # shellcheck disable=SC2009
  ps -ax | grep "$(command -v parallel)" | cut -b1-5 | xargs kill
}
