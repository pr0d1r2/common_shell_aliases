function screen_with_env_detached_named() {
  if [ -z "$1" ]; then
    echo "Please give name as first parameter !!!"
    return 1
  fi
  if [ -z "$2" ]; then
    echo "No command given (second parameter and more) !!!"
    return 2
  fi
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
    return 11
  fi
  screen_with_env_detached_named_WRAPPER="$(mktemp_executable)"
  echo "#!$SHELL
    source $screen_with_env_detached_named_PROFILE
    ${*:2}
    echo
    date
    echo
    echo 'Press ENTER to leave from shell.'
    read X
  " > "$screen_with_env_detached_named_WRAPPER"
  screen -S "$1" -d -m "$screen_with_env_detached_named_WRAPPER ; rm -f $screen_with_env_detached_named_WRAPPER"
}
