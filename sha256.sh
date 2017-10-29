function sha256() {
  parallel \
    "shasum -a 256 {}"
  return $?
}
