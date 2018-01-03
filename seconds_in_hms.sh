# Display seconds in HH:MM:SS format
#
# Example usage:
#   seconds_in_hms 8472
#   seconds_in_hms 6314.0066533088675
function seconds_in_hms() {
  ruby -e "puts Time.at($1).utc.strftime('%H:%M:%S')" 2>/dev/null
}
