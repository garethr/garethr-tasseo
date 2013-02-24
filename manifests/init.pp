class tasseo (
  $graphite_url = 'http://localhost:8081',
  $graphite_auth = false,
  $port = 5000
){
  class{'tasseo::params': } ->
  class{'tasseo::install': } ->
  class{'tasseo::config': } ~>
  class{'tasseo::service': } ->
  Class['tasseo']

  case $::operatingsystem {
    /(?i:CentOS|RedHat|Fedora)/:  { class {'tasseo::redhat': } }
    /(?i:Ubuntu|Debian|Mint)/:    { class {'tasseo::debian': } }
    default:                      { }
  }

}
