class app {
  exec { "update_package_list":
    user    => "vagrant",
    command => "/usr/bin/sudo /usr/bin/apt-get update",
  }
  package { [ "ntp", "git-core" ] :
    ensure => present
  }
  rvm::install {
    #for user
    'edward' : ;  
  }
}
