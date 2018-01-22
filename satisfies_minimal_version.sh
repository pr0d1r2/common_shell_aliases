# Check if version is satisfied
#
# Example usage (first param is required version, second actual):
#   satisfies_minimal_version 7.0.0 7.0.1
function satisfies_minimal_version() {
  local satisfies_minimal_version_REQUIRED_VERSION
  local satisfies_minimal_version_ACTUAL_VERSION
  local satisfies_minimal_version_ERROR_MESSAGE

  local satisfies_minimal_version_VERSION_ATOM_COUNTER
  local satisfies_minimal_version_ACTUAL_VERSION_ATOM
  local satisfies_minimal_version_REQUIRED_VERSION_ATOM

  satisfies_minimal_version_REQUIRED_VERSION=$(echo "$1" | tr -d '[:lower]')
  satisfies_minimal_version_ACTUAL_VERSION=$(echo "$2" | tr -d '[:lower]')
  satisfies_minimal_version_ERROR_MESSAGE="$satisfies_minimal_version_ACTUAL_VERSION < $satisfies_minimal_version_REQUIRED_VERSION"

  satisfies_minimal_version_VERSION_ATOM_COUNTER=1
  for satisfies_minimal_version_ACTUAL_VERSION_ATOM in $(
    echo "$satisfies_minimal_version_ACTUAL_VERSION" | tr '.' "\n"
  )
  do
    satisfies_minimal_version_REQUIRED_VERSION_ATOM=$(
      echo "$satisfies_minimal_version_REQUIRED_VERSION" | \
        cut -f "$satisfies_minimal_version_VERSION_ATOM_COUNTER" -d .
    )

    if [ "$satisfies_minimal_version_ACTUAL_VERSION_ATOM" -lt "$satisfies_minimal_version_REQUIRED_VERSION_ATOM" ]; then
      echo "$satisfies_minimal_version_ERROR_MESSAGE"
      return "$satisfies_minimal_version_VERSION_ATOM_COUNTER"
    elif [ "$satisfies_minimal_version_ACTUAL_VERSION_ATOM" -gt "$satisfies_minimal_version_REQUIRED_VERSION_ATOM" ]; then
      return 0
    fi

    satisfies_minimal_version_VERSION_ATOM_COUNTER=$((
      satisfies_minimal_version_VERSION_ATOM_COUNTER + 1
    ))
  done
}
