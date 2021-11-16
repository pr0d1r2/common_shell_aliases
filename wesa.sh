# Run watchexec command shortcut (with shell aliases included)
function wesa() {
  watchexec --shell "$SHELL" -- "clear && source ~/.compiled_shell_aliases.sh && $@"
}
