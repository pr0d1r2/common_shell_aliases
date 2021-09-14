function javascriptize() {
  echo "$(echo $1 | tr '[A-Z]' '[a-z]' | cut -b1)$(camelize $1 | cut -b2-)"
  return $?
}
