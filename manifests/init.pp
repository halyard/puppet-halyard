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
) {
  file { '/usr/local/bin':
    ensure => directory,
    user   => 'root',
    group  => 'wheel'
  }

  file { '/usr/local/bin/halyard':
    ensure => link,
    target => '/opt/halyard/repo/meta/halyard',
    user   => 'root',
    group  => 'wheel'
  }
}
