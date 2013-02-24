class tasseo::service {

  service { 'tasseo':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    provider   => $tasseo::params::service_provider,
    require    => [$tasseo::params::service_require, Class['tasseo::config']]
  }
}
