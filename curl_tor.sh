function curl_tor() {
  curl --preproxy socks5://127.0.0.1:9050 "$@"
  return $?
}
