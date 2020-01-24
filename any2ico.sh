function any2ico() {
  case $1 in
    "")
      echo "Please give source file as first parameter"
      return 1
      ;;
  esac
  case $2 in
    "")
      echo "Please give destination file as second parameter"
      return 2
      ;;
  esac
  command -v convert &>/dev/null || brew install imagemagick
  command -v png2ico &>/dev/null || brew install png2ico
  convert "$1" -colors 256 /tmp/any2ico.png && png2ico "$2 "/tmp/any2ico.png
  rm -f "/tmp/any2ico.png"
}
