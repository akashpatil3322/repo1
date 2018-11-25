class test {
  $pkg = 'httpd'
  $service = 'httpd'
  $files = [ '/var/www/html', '/var/log/httpd/patil.com' ]

  package { $pkg:
   ensure => present,
  }

  file { $files:
   ensure =>  present,
   owner => root,
   group => root,
  }
  
  file { '/var/www/html/index.html':
   ensure => present,
   content => "testing is working"
  }

 file { '/etc/httpd/conf.d/vhost.conf':
   ensure => present,
   owner => root,
   group => root,
   source => '/var/vhost.conf',
   notify => Service[$service],
 }

 service { $service:
  ensure => running,
 }
}
include test


