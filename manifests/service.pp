class tasseo::service {
  $graphite_url = $tasseo::graphite_url
  $graphite_auth = $tasseo::graphite_auth
  $port = $tasseo::port

  service { 'tasseo':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    provider   => $tasseo::params::service_provider,
    require    => [$tasseo::params::service_require, Class['tasseo::config']]
  }
}
