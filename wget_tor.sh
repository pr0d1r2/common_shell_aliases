function wget_tor() {
  ensure_command socksify || return $?
  SOCKS_SERVER="127.0.0.1:9050" SOCKS_PASSWORD="" socksify wget \
    --header="User-Agent: $WGET_USER_AGENT" \
    $@ || return $?
}
