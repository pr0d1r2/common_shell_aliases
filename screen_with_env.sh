function screen_with_env() {
  local screen_with_env_PROFILE
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
    return 1
  fi
  echo "#!$SHELL
    source $screen_with_env_PROFILE
    # shellcheck disable=SC2145
    $@
    echo
    echo 'Press ENTER to leave from shell.'
    read X
  " > /tmp/.screen_with_env-$$.sh
  chmod 700 /tmp/.screen_with_env-$$.sh
  screen /tmp/.screen_with_env-$$.sh
}
