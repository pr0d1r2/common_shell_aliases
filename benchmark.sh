benchmark() {
  local STARTTIME=`gdate +%s%N` ##Darwin
  local STARTTIME=`date +%s%N` ##Linux
  $@
  local FINISHTTIME=`gdate +%s%N` ##Darwin
  local STARTTIME=`date +%s%N` ##Linux
  echo '---'
  echo 'Running time (seconds):'
  echo "scale=5; ($FINISHTTIME - $STARTTIME) / 1000000000.0" | bc
}
