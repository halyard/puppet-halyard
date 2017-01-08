# == Class: halyard
#
# Set up basic system resources for running halyard
#
# === Parameters
#
# === Example
#
#   include halyard
#

class halyard (
  $bin_path = '/usr/local/bin'
) {
  $halyard_path = '/opt/halyard/repo'

  file { "${bin_path}/halyard":
    ensure => link,
    target => "${halyard_path}/meta/halyard"
  }
}
