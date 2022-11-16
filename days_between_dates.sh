function days_between_dates() {
  ruby -e "require 'Date' ; a = Date.parse('$1') ; b = Date.parse('$2') ; c = b.mjd - a.mjd ; puts c"
}
