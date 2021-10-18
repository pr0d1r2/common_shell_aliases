function in_loop() {
  while true
  do
    $@
    echo "# $@ => $?"
    sleep 5
  done
}
