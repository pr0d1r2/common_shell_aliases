# open ShellCheck documentation for specific check
#
# Example usage:
#   sc 2207
# Or:
#   sc SC2207
function sc() {
  parallel "open https://github.com/koalaman/shellcheck/wiki/SC{= s/[A-Za-z]// =}" ::: "$@"
}
