# Download file with checking checksum into specific directory
#
# Example usage:
#   download_with_checksum http://downloads.kali.org/pwk-kali-vm.7z f73585da634e2ac7d3b6cc6a73e717f022c273ba "$HOME/Downloads"
function download_with_checksum() {
  cd "$3" || return $?
  if ! (check_file_sum "$(basename "$1")" "$2"); then
    ensure_command axel || return $?
    axel -q "$1" || return $?
    if ! (check_file_sum "$(basename "$1")" "$2"); then
      rm -f "$(basename "$1")" || return $?
      return 100
    fi
  fi
}
