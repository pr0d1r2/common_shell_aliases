function prepend_file() {
  local prepend_file_TMP
  prepend_file_TMP="$(mktemp)"
  echo "${@:2}" > "$prepend_file_TMP" || return $?
  cat "$1" >> "$prepend_file_TMP" || return $?
  mv "$prepend_file_TMP" "$1" || return $?
}
