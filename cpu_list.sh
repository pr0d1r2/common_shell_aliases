# Useful for parallel command to run something on all cores
#
# For example, clonning parallel test databases fast:
# cpu_list | parallel "dropdb app_test{}; createdb app_test{} -T app_test -O app"
function cpu_list() {
  seq "$(nproc)"
  return $?
}
