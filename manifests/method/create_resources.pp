define yumgroup::method::create_resources($repos) {

  if $puppetversion !~ /^2\.7\./ {
    include puppetlabs-create_resources
  }
  create_resources(yumrepo, $repos)
}
