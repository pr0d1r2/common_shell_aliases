function whois_cached() {
  if [ -d "$HOME/Library/Caches/" ]; then
    local whois_cached_PARAM
    local whois_cached_CACHE
    for whois_cached_PARAM in $@
    do
      test -d "$HOME/Library/Caches/whois" || mkdir -p "$HOME/Library/Caches/whois"

      whois_cached_CACHE="$HOME/Library/Caches/whois/$whois_cached_PARAM"
      test -e "$whois_cached_CACHE" || whois "$whois_cached_PARAM" > "$whois_cached_CACHE" || rm "$whois_cached_CACHE"
      cat "$whois_cached_CACHE" || return 102
    done
  else
    echo "Add supported cache path !!!"
    return 101
  fi
}
