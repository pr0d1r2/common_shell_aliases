# Returns prefix for hexadecimal netmask given in the first argument
#
# Example usage:
#   ip_prefix_by_netmask 0xffffff00
# Or:
#   ip_prefix_by_netmask ffffff00
#
# Returns:
#   24
function ip_prefix_by_hexadecimal_mask() {
  ip_prefix_by_netmask "$(hexadecimal_mask_to_netmask "$1")"
  return $?
}
