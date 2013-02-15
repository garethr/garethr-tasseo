class tasseo::service {
  $graphite_url = $tasseo::graphite_url
  $graphite_auth = $tasseo::graphite_auth
  $port = $tasseo::port

  file { '/etc/init.d/tasseo':
    ensure => link,
    target => '/lib/init/upstart-job',
  }

  service { 'tasseo':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    provider   => upstart,
    require    => [
      File['/etc/init.d/tasseo'],
      File['/etc/init/tasseo.conf'],
    ],
  }
}
