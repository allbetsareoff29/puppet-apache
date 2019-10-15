# @summary Main Entry to module
#
# Main Entry to module
#
# @example
#   include apache
class apache (
  String $install_name,
  String $install_ensure,
  String $config_ensure,
  String $config_path,
  String $service_name,
  Boolean $service_enable,
  Enum["running", "stopped"] $service_ensure,
  ) {
  contain apache::install
  contain apache::config
  contain apache::service

  Class['::apache::install']
  -> Class['::apache::config']
  ~> Class['::apache::service']
}
