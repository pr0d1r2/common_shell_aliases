function wget_tor() {
  ensure_command socksify || return $?
  SOCKS_SERVER="127.0.0.1:9050" SOCKS_PASSWORD="" socksify wget \
    --header="User-Agent: Mozilla/5.0 (Windows NT 5.1; rv:23.0) Gecko/20100101 Firefox/23.0" \
    $@ || return $?
}
