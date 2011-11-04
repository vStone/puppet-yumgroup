define yumgroup::create_file ($target) {

  exec {"add_repo_${name}_to_${target}":
    command     =>
      "echo -e '[${name}]\nname=Placeholder for ${name}' >> ${target}",
    unless      => "grep '\\[${name}\\]' ${target}",
    path        => '/bin:/usr/bin:/usr/local/bin',
  }

}

