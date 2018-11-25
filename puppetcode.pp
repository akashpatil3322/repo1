class httpdinstall {
 $pkg = 'httpd'
 $service = 'httpd'
 package { $pkg:
  ensure => present,
  notify => Service[$service]
 }
 service { $service:
  ensure => running,
 }
}
include httpdinstall
