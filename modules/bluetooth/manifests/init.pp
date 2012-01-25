class bluetooth {
  package { 'bluez-libs':
    ensure => present,
    before => Service['hidd'],
  }
  package { 'bluez-utils':
    ensure => present,
    before => Service['hidd'],
  }
  service { 'hidd':
    ensure => running,
    enable => true,
    status => 'source /etc/init.d/functions && status hidd'
  }
}
