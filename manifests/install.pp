# @summary Installs the base Apache package
#
# Installs the base Apache package
#


## WITHOUT HIERA
#class apache::install (
#  $install_name   = $apache::params::install_name,
#  $install_ensure = $apache::params::install_ensure,
#  ) inherits apache::params {
#  package { "$install_name":
#    ensure => $install_ensure,
#  }
#}


## WITH HIERA
class apache::install {
  package { "${apache::install_name}":
    ensure => $apache::install_ensure,
  }
}

