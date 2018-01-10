function gravatar_open() {
  parallel \
    "source $HOME/projects/common_shell_aliases/gravatar_url.sh && \
     open -a 'Google Chrome' '\$(gravatar_url {})'" \
    ::: \
    "$@"
  return $?
}
