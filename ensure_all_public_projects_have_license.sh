function ensure_all_public_projects_have_license() {
  github_repos_public_urls pr0d1r2 | parallel basename | sed -e "s/\.git$//" | \
    parallel "cd $HOME/projects/{} && test -f LICENSE || (cp $HOME/projects/gentoo_kernel_ensure/LICENSE . && git add LICENSE && git commit LICENSE -m 'Add missing LICENSE' && git push)"
}
