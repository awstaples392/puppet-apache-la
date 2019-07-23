# @summary 
#   Linux Academy puppet 206 class - installs base apache package.  
#
class apache::install {
  package { 'httpd':
    ensure  => 'present',
  }
}
