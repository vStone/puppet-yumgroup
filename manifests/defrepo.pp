# Class: yumgroup::defrepo

define yumgroup::defrepo($repos) {
  create_resources(yumrepo, $repos)
}
