# Detect local networks
#
# Example usage:
#   local_networks
# May return:
#   192.168.0.0/24
#   192.168.1.0/24
function local_networks() {
  ifconfig | \
    grep -E "inet 192.168" | \
    cut -b7-38 | \
    sed -e 's/ $//' -e 's/ netmask /\//' -e 's/[[:digit:]]*\/0x/0\//' | \
    sort -u | \
    parallel "source $HOME/projects/common_shell_aliases/hexadecimal_mask_to_netmask.sh;
              source $HOME/projects/common_shell_aliases/ip_prefix_by_hexadecimal_mask.sh;
	            source $HOME/projects/common_shell_aliases/ip_prefix_by_netmask.sh;
              echo -n {//}/\$(ip_prefix_by_hexadecimal_mask {/})"
  echo
}
