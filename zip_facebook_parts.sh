# Compress files to be sent via Facebook
# (max 25MB and "zip" renamed to "z00" to prevent auto-unpacking via Facebook and returning error)
#
# Example usage
#   zip_facebook_parts file_bigger_than_25mb.mp3
function zip_facebook_parts() {
  parallel \
    "zip -r -s 18m {}.zip {} && mv {}.zip {}.z00" \
    ::: \
    "$@"
  return $?
}
