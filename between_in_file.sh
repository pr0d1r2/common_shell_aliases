function between_in_file() {
  sed -n "/$1/,/$2/p" "$3" | sed -e "/$1/d" -e "/$2/d"
}
