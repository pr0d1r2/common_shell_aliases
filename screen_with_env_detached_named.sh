function screen_with_env_detached_named() {
  local screen_with_env_detached_named_PROFILE
  local screen_with_env_detached_named_WRAPPER
  case $(basename "$SHELL") in
    zsh)
      screen_with_env_detached_named_PROFILE="$HOME/.zshrc"
      ;;
    bash)
      screen_with_env_detached_named_PROFILE="$HOME/.bash_profile"
      ;;
  esac
  if [ ! -e "$screen_with_env_detached_named_PROFILE" ]; then
    echo "No $screen_with_env_detached_named_PROFILE file !!!"
    return 1
  fi
  screen_with_env_detached_named_WRAPPER="/tmp/.screen_with_env_detached_named-$$-$(echo "$@" | md5sum).sh"
  echo "#!$SHELL
    source $screen_with_env_detached_named_PROFILE
    ${@:2}
    echo
    echo 'Press ENTER to leave from shell.'
    read X
  " > "$screen_with_env_detached_named_WRAPPER"
  chmod 700 "$screen_with_env_detached_named_WRAPPER"
  screen -S "$1" -d -m "$screen_with_env_detached_named_WRAPPER"
}
