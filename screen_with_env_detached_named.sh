function screen_with_env_detached_named() {
  local screen_with_env_detached_named_PROFILE
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
  echo "#!$SHELL
    source $screen_with_env_detached_named_PROFILE
    ${@:2}
    echo
    echo 'Press ENTER to leave from shell.'
    read X
  " > /tmp/.screen_with_env_detached_named-$$.sh
  chmod 700 /tmp/.screen_with_env_detached_named-$$.sh
  screen -S $1 -d -m /tmp/.screen_with_env_detached_named-$$.sh
}
