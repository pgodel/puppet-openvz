class openvz::template::getCentOS_5_x86_64 { 
	exec {
		"get CentOS5 64 template":
			command => "wget -c http://download.openvz.org/template/precreated/centos-5-x86_64.tar.gz",
			cwd => "/vz/template/cache/",
			require => [Package["ovzkernel"],Package["vzctl"]],
			creates => "/vz/template/cache/centos-5-x86_64.tar.gz";
	}
}

class openvz::template::getCentOS_6_x86_64 { 
	exec {
		"get CentOS6 64 template":
			command => "wget -c http://download.openvz.org/template/precreated/centos-6-x86_64.tar.gz",
			cwd => "/vz/template/cache/",
			require => [Package["ovzkernel"],Package["vzctl"]],
			creates => "/vz/template/cache/centos-6-x86_64.tar.gz";
	}
}

class openvz::template::getDebian64 { 
	exec {
		"get Debian6 64 template":
			command => "wget -c http://download.openvz.org/template/precreated/debian-6.0-x86_64.tar.gz",
			cwd => "/vz/template/cache/",
			require => [Package["ovzkernel"],Package["vzctl"]],
			creates => "/vz/template/cache/debian-6.0-x86_64.tar.gz";
	}
}