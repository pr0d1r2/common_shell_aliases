function active_support_inflector() {
  # shellcheck disable=SC2145
  ruby -e "require 'active_support/inflector' ; puts ActiveSupport::Inflector.$1('${@:2}')" || return $?
}
