# @summary Main Entry to module
#
# Main Entry to module
#
# @example
#   include apache
class apache (
  String $install_name,
  String $install_ensure,
  ) {
  include apache::install
}
