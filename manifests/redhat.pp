class tasseo::redhat {

  file { '/etc/rc.d/init.d/tasseo':
    ensure => present,
    source => 'puppet:///modules/tasseo/tasseo.init',
    mode   => '0755'
  }

}