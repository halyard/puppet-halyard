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
  $root_path = '/opt/halyard'
  $repo_path = "${root_path}/repo"
  $bin_path = "${root_path}/vendor/bin"

  file { '/usr/local/bin':
    ensure => directory,
    owner  => 'root',
    group  => 'wheel'
  }

  file { '/usr/local/bin/halyard':
    ensure => link,
    target => "${repo_path}/meta/halyard",
    owner  => 'root',
    group  => 'wheel'
  }

  include sudoers

  sudoers::allowed_command{ 'halyard_puppet':
    command          => "${bin_path}/puppet",
    user             => $facts['id'],
    require_password => false,
    comment          => 'Allows halyard user to run puppet',
    require_exist    => false
  }
}
