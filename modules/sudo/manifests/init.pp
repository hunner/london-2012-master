class sudo {
  File {
    owner  => 'root',
    group  => 'root',
    mode   => '0440',
  }
  $source = 'puppet:///modules/sudo/sudoers'
  $temp_file = '/etc/sudoers.check'
  file { $temp_file:
    ensure => present,
    source => $source,
    before => Exec['check sudoers'],
  }
  exec { "check sudoers":
    command => "/usr/sbin/visudo -c -f ${temp_file}",
    unless  => "/bin/diff /etc/sudoers ${temp_file}",
  }
  file { '/etc/sudoers':
    ensure  => present,
    source  => $temp_file,
    require => Exec['check sudoers'],
  }
}
