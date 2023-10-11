function rc_raw() {
  case $1 in
    bundle)
      $@ || return $?
      ;;
    *)
      bundle exec $@ || return $?
      ;;
  esac
  git add . || return $?
  git commit -a -m "$(echo $@)" || return $?
}
