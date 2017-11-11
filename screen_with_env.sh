function screen_with_env() {
  if [ -z "$1" ]; then
    echo "No command given (first parameter and more) !!!"
    return 1
  fi
  local screen_with_env_PROFILE
  local screen_with_env_WRAPPER
  case $(basename "$SHELL") in
    zsh)
      screen_with_env_PROFILE="$HOME/.zshrc"
      ;;
    bash)
      screen_with_env_PROFILE="$HOME/.bash_profile"
      ;;
  esac
  if [ ! -e "$screen_with_env_PROFILE" ]; then
    echo "No $screen_with_env_PROFILE file !!!"
    return 11
  fi
  screen_with_env_WRAPPER="/tmp/.screen_with_env-$$-$(echo "$@" | md5sum).sh"
  echo "#!$SHELL
    source $screen_with_env_PROFILE
    # shellcheck disable=SC2145
    $@
    echo
    echo 'Press ENTER to leave from shell.'
    read X
  " > "$screen_with_env_WRAPPER"
  chmod 700 "$screen_with_env_WRAPPER"
  screen "$screen_with_env_WRAPPER"
}
