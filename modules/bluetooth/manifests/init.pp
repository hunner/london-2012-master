class bluetooth($disable = false) {
  $enable = ! $disable
  if $enable {
    $ensure = 'present'
    Package['bluez-libs'] -> Package['bluez-utils'] -> Service['hidd']
  } else {
    $ensure = 'absent'
    Package['bluez-libs'] <- Package['bluez-utils'] <- Service['hidd']
  }
  package { [
    'bluez-libs',
    'bluez-utils',
  ]:
    ensure => $ensure,
  }
  service { 'hidd':
    ensure => $enable,
    enable => $enable,
    status => 'source /etc/init.d/functions && status hidd'
  }
}
