# Return difference between depth of directory structure as an integer
#
# Example usage:
#   path_depth_diff spec/support spec/support/something
# Will return:
#   1
function path_depth_diff() {
  echo "$(( $(path_depth "$2") - $(path_depth "$1") ))"
}
