class bluetooth::disable {
  package { 'bluez-libs':
    ensure  => absent,
    require => [
      Package['bluez-utils'],
      Service['hidd'],
    ],
  }
  package { 'bluez-utils':
    ensure  => absent,
    require => Service['hidd'],
  }
  service { 'hidd':
    ensure => stopped,
    enable => false,
    status => 'source /etc/init.d/functions && status hidd'
  }
}
