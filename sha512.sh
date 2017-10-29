function sha512() {
  parallel \
    "shasum -a 512 {}"
  return $?
}
