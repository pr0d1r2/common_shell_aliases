# Automatically resolve known ShellCheck issues.
#
# Example usage: shellcheck_resolve file.sh directory
function shellcheck_resolve() {
  rg -l which "$(ls -d "$@")" | \
    parallel "rpl 'which' 'command -v' {} ;
              shellcheck -e SC2148 {} && git commit {} -m 'Conform to ShellCheck'"

  # Own checks
  rg -l "#!/bin/bash" "$(ls -d "$@")" | \
    parallel "rpl '#!/bin/bash' '#!/usr/bin/env bash' {} &&
              shellcheck -e SC2148 {} && git commit {} -m 'Conform to shellcheck_resolver'"
}
