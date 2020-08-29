function ask_seriuosly_destructive() {
  local ask_seriuosly_destructive_ANSWER
  echo "$@"
  echo "THIS IS DESTRUCTIVE OPERATION (please type upcase 'YES' if you really want to do it):"
  read ask_seriuosly_destructive_ANSWER
  case "$ask_seriuosly_destructive_ANSWER" in
    YES)
      return 0
      ;;
  esac
  return 1
}
