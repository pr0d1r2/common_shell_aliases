function screen_with_env_detached() {
  if [ -z "$1" ]; then
    echo "No command given (first parameter and more) !!!"
    return 1
  fi
  local screen_with_env_detached_PROFILE
  local screen_with_env_detached_WRAPPER
  case $(basename "$SHELL") in
    zsh)
      screen_with_env_detached_PROFILE="$HOME/.zshrc"
      ;;
    bash)
      screen_with_env_detached_PROFILE="$HOME/.bash_profile"
      ;;
  esac
  if [ ! -e "$screen_with_env_detached_PROFILE" ]; then
    echo "No $screen_with_env_detached_PROFILE file !!!"
    return 11
  fi
  screen_with_env_detached_WRAPPER="/tmp/.screen_with_env_detached-$$-$(echo "$@" | md5sum).sh"
  echo "#!$SHELL
    source $screen_with_env_detached_PROFILE
    $*
    echo
    date
    echo
    echo 'Press ENTER to leave from shell.'
    read X
  " > "$screen_with_env_detached_WRAPPER"
  chmod 700 "$screen_with_env_detached_WRAPPER"
  screen -d -m "$screen_with_env_detached_WRAPPER"
}
