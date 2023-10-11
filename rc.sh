function rc() {
  git_clean || return $?
  rc_raw $@ || return $?
}
