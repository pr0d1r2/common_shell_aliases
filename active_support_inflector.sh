function active_support_inflector() {
  ruby -e "require 'active_support/inflector' ; puts ActiveSupport::Inflector.$1('${*:2}')" || return $?
}
