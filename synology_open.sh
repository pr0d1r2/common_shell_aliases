# Opens web interface to all Synology devices in local networks
#
# Example usage:
#   synology_open
function synology_open() {
  local_networks |
    parallel \
      "nmap -p 5000 {}" | \
      tr -d "\n" | \
      sed -e "s/Nmap scan report for/|/g" | \
      tr '|' "\n" | \
      grep "tcp open" | \
      sed -e "s/Host is up/|/" | \
      cut -f 1 -d '|' | \
      cut -b2- | \
  parallel \
    "nmap -p 5001,50001,50002 {} | tr -d \"\\n\" | grep -q 'STATE SERVICE5001/tcp  open  commplex-link50001/tcp open  unknown50002/tcp open  iiimsf' &&
     echo http://{}:5000 &&
     open http://{}:5000"
}
