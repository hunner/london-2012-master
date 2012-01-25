class motd {
  $boxowner = "dev team"
  file { '/etc/motd':
    ensure  => present,
    content => template('motd/motd.erb'),
  }
}
