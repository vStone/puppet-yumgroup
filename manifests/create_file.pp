define yumgroup::create_file ($target) {

  exec {"add_repo_${name}_to_${target}":
    command     =>
      "echo -e '[${name}]\ndescr=Placeholder for ${name}' >> ${target}",
    unless      => "grep '\\[${name}\\]' ${target}",
  }

}

