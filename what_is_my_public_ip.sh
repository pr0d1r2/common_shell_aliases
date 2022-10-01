function what_is_my_public_ip() {
  wget -O - -q https://checkip.amazonaws.com
}
