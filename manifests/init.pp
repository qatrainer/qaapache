class qaapache {
package { 'httpd':
  ensure => present,
}

file { '/var/www':
  ensure => directory,
}

file { '/var/www/html':
  ensure => directory,
}

file { '/var/www/html/index.html':
  ensure => 'file',
  source => 'puppet:///modules/qaapache/index.html',
}

file { '/etc/httpd/conf/httpd.conf':
  ensure => file,
  owner => 'root',
  group => 'root',
  source => 'puppet:///modules/qaapache/httpd.conf',
  require => Package['httpd'],

}
service { 'httpd':
  ensure => running,
  subscribe => File['/etc/httpd/conf/httpd.conf'],
}
}
