class tasseo::service {
  $graphite_url = $tasseo::graphite_url
  $port = $tasseo::port

  file { '/etc/init.d/tasseo':
    ensure => link,
    target => '/lib/init/upstart-job',
  }

  file { '/etc/init/tasseo.conf':
    ensure  => present,
    content => template('tasseo/etc/init/tasseo.conf.erb'),
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
