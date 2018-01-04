function gz_to_xz_in_directory() {
  parallel \
    'test -d {} && find {} -type f -iname "*.gz"' \
      parallel 'echo "{}" "=>" "{= s/.gz$/.xz/ =}" ; gzip -cd "{}" | xz -c9 > "{= s/.gz$/.xz/ =}" && rm -f "{}"'
}
