function silently_snippet() {
  case $(uname) in
    Darwin)
      echo "source $HOME/projects/common_shell_aliases/silently.sh && source $HOME/projects/osx_shell_aliases/md5sum.sh"
      ;;
    *)
      echo "source $HOME/projects/common_shell_aliases/silently.sh"
      ;;
  esac
}
