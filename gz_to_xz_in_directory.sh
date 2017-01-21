function gz_to_xz_in_directory() {
  local gz_to_xz_in_directory_DIR
  for gz_to_xz_in_directory_DIR in $@
  do
    if [ -d $gz_to_xz_in_directory_DIR ]; then
      find $gz_to_xz_in_directory_DIR -type f -iname "*.gz" | \
        parallel 'echo "{}" "=>" "{= s/.gz$/.xz/ =}" ; gzip -cd "{}" | xz -c9 > "{= s/.gz$/.xz/ =}" && rm -f "{}"'
   fi
  done
}
