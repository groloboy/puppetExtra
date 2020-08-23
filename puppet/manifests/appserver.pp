#puppet essential...
group { 'puppet': ensure => 'present' }#global path def.
Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] } 

include users
include rvm
include app
