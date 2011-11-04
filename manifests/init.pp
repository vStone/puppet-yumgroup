# Class: yumgroup
#
# Ensure that yum repo definitions are placed together in a single repo file.
#
define yumgroup (
  $repos,
  $target = undef,
  $overrides = undef,
  $method = 'create_resources'
) {

  $target_file = $target ? {
    undef   => "/etc/yum.repos.d/${name}.repo",
    default => $target
  }

  file {"target-${name}":
    ensure  => present,
    mode    => '0644',
    path    => $target_file,
    owner   => root,
    group   => root,
  }

  $repo_names = hash_keys($repos)

  yumgroup::create_file {$repo_names:
    target    => $target_file,
    require   => File["target-${name}"],
  }

  case $method {
    'create_resources': {
      yumgroup::method::create_resources {$name:
        repos     => $repos,
        require   => Yumgroup::Create_file[$repo_names],
      }
    }
    'yumrepo', default: {
      yumgroup::method::yumrepo {$name:
        repo_names => $repo_names,
        require    => Yumgroup::Create_file[$repo_names],
      }
    }
  }

}
