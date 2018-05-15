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
  Array[String] $allowed_env_variables = ['DEBUG', 'PUPPET_ENV', 'PROFILE']
) {
  $root_path = '/opt/halyard'
  $repo_path = "${root_path}/repo"

  file { '/usr/local/bin':
    ensure => directory,
    owner  => 'root',
    group  => 'wheel'
  }

  file { '/usr/local/bin/halyard':
    ensure  => file,
    content => epp('halyard/sudo_halyard.epp', { 'repo_path' => $repo_path }),
    owner   => 'root',
    group   => 'wheel',
    mode    => '0755'
  }

  $commands = [
    "${repo_path}/meta/halyard",
    "/bin/sh -c ${repo_path}/meta/halyard"
  ]

  sudoers::allowed_command{ 'halyard_puppet':
    command               => join($commands, ','),
    user                  => $facts['id'],
    require_password      => false,
    comment               => 'Allows halyard user to run puppet',
    require_exist         => false,
    allowed_env_variables => $allowed_env_variables,
    defaults              => ['secure_path = /sbin:/bin:/usr/sbin:/usr/bin']
  }
}
