# ReMove Quickly
#
# Renames a directory and start removing it in background.
# Useful for huge directories.
#
# Example usage:
#   rmq node_modules && yarn
function rmq() {
  parallel \
    "mv {} {}-deleting-$$ && screen -d -m -S {}-deleting-$$ rm -rf {}-deleting-$$" \
    ::: \
    "$@"
  return $?
}
