class users {

user { "brayan":
	ensure => "present",
	shell => "/bin/bash",
	managehome => true,
}

}
