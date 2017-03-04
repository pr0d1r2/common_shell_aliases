function dos2unix_all() {
  find . -type f | grep -v "^./.git" | parallel dos2unix
}
