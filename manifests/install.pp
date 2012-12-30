class tasseo::install {
  vcsrepo { '/opt/tasseo':
    ensure   => present,
    provider => git,
    source   => 'git://github.com/obfuscurity/tasseo.git',
    before   => Exec['bundle_tasseo'],
  }

  exec { 'bundle_tasseo':
    command => 'bundle install --path vendor',
    cwd     => '/opt/tasseo',
    creates => '/opt/tasseo/vendor',
  }
}
