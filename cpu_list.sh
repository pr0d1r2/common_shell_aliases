# Useful for parallel command to run something on all cores
#
# For example, clonning parallel test databases fast:
# cpu_list | parallel "dropdb app_test{}; createdb app_test{} -T app_test -O app"
function cpu_list() {
  local cpu_list_NUM=1
  local cpu_list_NPROC=`nproc`
  while [ $cpu_list_NUM -le $cpu_list_NPROC ]; do
    echo $cpu_list_NUM
    cpu_list_NUM=`expr $cpu_list_NUM + 1`
  done
}
