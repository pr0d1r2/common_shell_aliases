# Returns netmask for hexadecimal mask given in the first argument
#
# Example usage:
#   hexadecimal_mask_to_netmask 0xffffff00
# Or:
#   hexadecimal_mask_to_netmask ffffff00
#
# Returns:
#   255.255.255.0
function hexadecimal_mask_to_netmask() {
  echo "$1" | \
    sed -e "s/^0x//" | \
    tr '[a-z]' '[A-Z]' | \
    sed 's/.\{2\}/&./g' | \
    sed -e 's/\.$//' | \
    tr '.' "\n" | \
    parallel 'echo "obase=10; ibase=16; {}" | bc' | \
    tr "\n" '.' | \
    sed -e 's/\.$//'
}
