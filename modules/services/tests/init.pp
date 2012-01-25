# qotd		17/tcp		quote
# qotd		17/udp		quote
# msp		18/tcp				# message send protocol
# msp		18/udp				# message send protocol
# chargen		19/tcp		ttytst source
# chargen		19/udp		ttytst source
include services
services::service { 'qotd':
  port      => '17',
  protocols => ['tcp','udp'],
  aliases   => 'quote',
}
services::service { 'msp':
  port      => '18',
  protocols => ['tcp','udp'],
  comment   => 'message send protocol',
}
services::service { 'chargen':
  port      => '19',
  protocols => ['tcp','udp'],
  aliases   => ['ttytst','source'],
}
