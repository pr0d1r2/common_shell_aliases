# Extract 7z file in parallel
# This is proof-of-concept, which is working slow. Need to investigate later.
#
# Example usage:
#   7z_parallel_extract my.7z
function 7z_parallel_extract() {
  7z l "$1" | \
    grep -E "^[0-9]{4}-[0-9]{2}-[0-9]{2}" | \
    cut -b "$(7z l "$1" | grep "^----" | uniq | cut -f 1-4 -d ' ' | wc -c)-" | \
    cut -b 3- | \
    grep -vE "\d files, \d folders" | \
      parallel "7z x -y '$1' {} -r"
}
