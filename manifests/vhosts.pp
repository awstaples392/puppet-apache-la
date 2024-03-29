# @summary .
#   Generates vhosts files. 
# @example
# apache::vhosts { 'namevar':
#   port      => INT,
#   subdomain => STR,
#   admin     => STR,
#   docroot   => STR,
define apache::vhosts (
  Integer   $port,
  String[1] $subdomain,
  String    $admin,
  String[1] $docroot,
) {
  file { "${docroot}":
    ensure => 'directory',
    owner  => $apache_vhosts_owner,
    group  => $apache_vhosts_group,
  }
  file { "${apache::vhosts_dir}/${subdomain}.conf":
    ensure   => 'file',
    owner    => $apache_vhosts_owner,
    group    => $apache_vhosts_group,
    mode     => '0644',
    content  => epp('apache/vhosts.conf.epp', {'port' => $port, 'subdomain' => $subdomain, 'admin' => $admin, 'docroot' => $docroot}),
    notify   => Service['apache_service'],
  }
}
