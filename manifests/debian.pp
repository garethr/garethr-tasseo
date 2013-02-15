class tasseo::debian {

  file { '/etc/init.d/tasseo':
    ensure => link,
    target => '/lib/init/upstart-job',
  }

}