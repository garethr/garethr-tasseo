class tasseo::config {

  file { $tasseo::params::config_file:
    ensure  => present,
    content => $tasseo::params::config_content
  }

}
