function whois_cached() {
  test -z "$2"

  if [ -d "$HOME/Library/Caches/" ]; then
    test -d "$HOME/Library/Caches/whois" || mkdir -p "$HOME/Library/Caches/whois"
    test -e "$HOME/Library/Caches/whois/$1" || whois "$1" > "$HOME/Library/Caches/whois/$1" || rm "$HOME/Library/Caches/whois/$1"

    cat "$HOME/Library/Caches/whois/$1" || return 102
  else
    echo "Add supported cache path !!!"
    return 101
  fi
}
