benchmark() {
  local benchmark_STARTTIME
  local benchmark_FINISHTTIME
  benchmark_STARTTIME=$(gdate +%s%N) ##Darwin
  benchmark_STARTTIME=$(date +%s%N) ##Linux
  "$@"
  benchmark_FINISHTTIME=$(gdate +%s%N) ##Darwin
  benchmark_FINISHTTIME=$(date +%s%N) ##Linux
  echo '---'
  echo 'Running time (seconds):'
  echo "scale=5; ($benchmark_FINISHTTIME - $benchmark_STARTTIME) / 1000000000.0" | bc
}
