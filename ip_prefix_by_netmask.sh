# Returns prefix for netmask given in first argument
#
# Example usage:
#   ip_prefix_by_netmask 255.255.255.0
# Returns:
#   24
function ip_prefix_by_netmask() {
  bits=0
  for octet in $(echo $1 | sed 's/\./ /g')
  do
    binbits=$(echo "obase=2; ibase=10; ${octet}"| bc | sed 's/0//g')
    bits=$(expr $bits + ${#binbits})
  done
  echo "${bits}"
}
