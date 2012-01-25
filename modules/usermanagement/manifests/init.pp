class usermanagement {
  file { '/home':
    ensure => directory,
    owner  => '0',
    group  => '0',
    mode   => '0755',
  }
}
