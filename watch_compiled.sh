function watch_compiled() {
  watch "zsh -c 'source ~/.compiled_shell_aliases.sh && $@'"
  return $?
}
