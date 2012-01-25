class services {
  $basedir = '/tmp'
  file { "${basedir}/services.d":
    ensure  => directory,
    purge   => true,
    recurse => true,
  }
  file { "${basedir}/services.d/00-header":
    ensure => present,
    source => 'puppet:///modules/services/header',
    notify => Exec['rebuild-services'],
  }
  exec { 'rebuild-services':
    command     => "/bin/cat ${basedir}/services.d/* > ${basedir}/services.conf",
    refreshonly => true,
    subscribe   => File["${basedir}/services.d"],
  }
  file { "${basedir}/services.conf":
    mode    => '0644',
    require => Exec['rebuild-services'],
  }
}
