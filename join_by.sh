# Joins array with delimiter
#
# Example usage:
#   join_by , a b c
# Will return:
#   a,b,c
function join_by {
  local join_by_DELIMITER=$1
  shift
  echo -n "$1"
  shift
  printf "%s" "${@/#/$join_by_DELIMITER}";
}
