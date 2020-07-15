# Show last year dates
#
# Example usage:
#   last_year_dates
# Returns:
#   2020-07-15
#   2020-07-14
#   ...
#   2019-07-16
function last_year_dates() {
  ruby -e "require 'date' ; Date.today.downto(Date.today-365) { |d| puts d }"
  return $?
}
