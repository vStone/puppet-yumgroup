# Class: yumgroup
#
# Ensure that yum repo definitions are placed together in a single repo file.
#
define yumgroup (
  $repos,
  $target = undef
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

  yumgroup::defrepo {$name:
    repos     => $repos,
    require   => Yumgroup::Create_file[$repo_names],
  }

  Yumgroup::Create_file<| |> -> Yumgroup::Defrepo <| |>

}
