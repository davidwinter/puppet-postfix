# == Class: postfix
#
# See README.md
#
class postfix {
  package { 'postfix':
    ensure => present,
  }

  service { 'postfix':
    require => Package['postfix'],
  }

  exec { 'postfix set mydestination':
    command => 'sed -i.bak \
      "s/mydestination = .*/mydestination = localhost/" \
      /etc/postfix/main.cf',
    unless  => 'grep "mydestination = localhost" /etc/postfix/main.cf',
    require => Package['postfix'],
    notify  => Service['postfix'],
  }

  exec { 'postfix set inet_interfaces':
    command => 'sed -i.bak \
      "s/inet_interfaces = .*/inet_interfaces = 127.0.0.1/" \
      /etc/postfix/main.cf',
    unless  => 'grep "inet_interfaces = 127.0.0.1" /etc/postfix/main.cf',
    require => Package['postfix'],
    notify  => Service['postfix'],
  }
}