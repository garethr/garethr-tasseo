class tasseo::params {

  $service_require = $::operatingsystem ? {
    /(?i:Ubuntu|Debian|Mint)/ => Class['tasseo::debian'],
    default                   => Class['tasseo::redhat']
  }

  $service_provider = $::operatingsystem ? {
    /(?i:Ubuntu|Debian|Mint)/ => upstart,
    default                   => redhat
  }

  $config_file = $::operatingsystem ? {
    /(?i:Ubuntu|Debian|Mint)/ => '/etc/init/tasseo.conf',
    default                   => '/etc/sysconfig/tasseo'
  }

  $config_content = $::operatingsystem ? {
    /(?i:Ubuntu|Debian|Mint)/ => template('tasseo/etc/init/tasseo.conf.erb'),
    default                   => template('tasseo/etc/sysconfig/tasseo.erb')
  }

}