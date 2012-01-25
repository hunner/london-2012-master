class virtual_cron {
  @cron { 'logrotate1':
    command => '/usr/sbin/logrotate',
    user    => 'root',
    hour    => '2',
    minute  => '0',
  }
  @cron { 'logrotate2':
    command => '/usr/sbin/logrotate',
    user    => 'root',
    hour    => '2',
    minute  => '30',
  }
  @cron { 'logrotate3':
    command => '/usr/sbin/logrotate',
    user    => 'root',
    hour    => '3',
    minute  => '0',
  }
}
