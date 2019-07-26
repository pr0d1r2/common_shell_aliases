# Run shellcheck on changed files in parallel
#
# Example usage:
#   shellcheck_changed
function shellcheck_changed() {
  git_files_changed | parallel shellcheck
}
