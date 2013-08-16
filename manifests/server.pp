# == Class: openvz::server
#
# This class installs and configures an OpenVZ hardware node
#
# === Parameters
#
# None.
#
class openvz::server inherits openvz {

	# so sometimes we want the VEs to use bridging, we need the bridging tools

	package { "bridge-utils" : ensure => installed; }

	# OpenVZ installation according to http://wiki.openvz.org/Quick_installation
	file {
		"/etc/yum.repos.d/openvz.repo":
			mode => 0644,
			owner => root,
			group => root,
			source => "puppet://${puppetserver}/modules/openvz/etc/yum.repos.d/openvz.repo",
			ensure => present,
	}
	exec {
		"import_openvz_repo_key":
			command => "rpm --import  http://download.openvz.org/RPM-GPG-Key-OpenVZ",
			subscribe => File["/etc/yum.repos.d/openvz.repo"],
			refreshonly => true
	}

	package {
		"ovzkernel":
			name => $lsbmajdistrelease ? {
				5 => "ovzkernel.${::hardwaremodel}",
				6 => "vzkernel.${::hardwaremodel}"
			},
			ensure => installed,
			require => File["/etc/yum.repos.d/openvz.repo"];
		"vzctl":
			name => "vzctl.${::hardwaremodel}",
			ensure => installed,
			require => [ File["/etc/yum.repos.d/openvz.repo"], Package["ovzkernel"] ];
		"vzquota":
			name => "vzquota.${::hardwaremodel}",
			ensure => installed,
			require => [ File["/etc/yum.repos.d/openvz.repo"], Package["ovzkernel"] ];
		"ploop":
			name => "ploop.${::hardwaremodel}",
			ensure => installed,
			require => [ File["/etc/yum.repos.d/openvz.repo"], Package["ovzkernel"] ];
	}

	# Run ovz environment at boot. This will fail on the first 
	# puppet run, because we need a reboot to load the new vzkernel.
	service {
		"vz":
			enable => true,
			hasstatus => true,
			ensure => running,
			require => Package["vzctl"];
	}
}

