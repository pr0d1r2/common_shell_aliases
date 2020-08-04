# Return depth of directory structure as an integer
#
# Example usage:
#   path_depth spec/support
# Will return:
#   2
function path_depth() {
  echo $1 | tr "/" "\n" | wc -l | awk '{gsub(/^ +| +$/,"")} {print $0}'
}
