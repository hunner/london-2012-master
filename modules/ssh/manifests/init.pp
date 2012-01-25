class ssh {
  File {
    owner => 'root',
    group => 'root',
    mode  => '0644',
  }

  package { 'sshd':
    ensure => installed,
    name   => 'openssh-server',
  }

  file { '/etc/ssh/sshd_config':
    ensure  => present,
    source  => 'puppet:///modules/ssh/sshd_config',
    mode    => '0600',
    require => Package['sshd'],
    notify  => Service['sshd'],
  }

  service { 'sshd':
    ensure    => running,
    enable    => true,
  }
}
