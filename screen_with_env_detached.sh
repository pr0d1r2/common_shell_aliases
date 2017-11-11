function screen_with_env_detached() {
  local screen_with_env_detached_PROFILE
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
    return 1
  fi
  echo "#!$SHELL
    source $screen_with_env_detached_PROFILE
    $@
    echo
    echo 'Press ENTER to leave from shell.'
    read X
  " > /tmp/.screen_with_env_detached-$$.sh
  chmod 700 /tmp/.screen_with_env_detached-$$.sh
  screen -d -m /tmp/.screen_with_env_detached-$$.sh
}
