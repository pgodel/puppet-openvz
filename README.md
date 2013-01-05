# Module OpenVZ

This module installs and configures an OpenVZ server. We try to follow the recomendations of http://wiki.openvz.org/

# Tested on
RHEL/CentOS 5+  
RHEL/CentOS 6+  

# Requirements

This module installs a new kernel and other programms that need a reboot. So the first run will not exit without errors. You have to make the reboot yourself.

# Parameters

# Sample usage:

### Setup OpenVZ hardware node
<pre>
node "openvzserver.my.domain" {
	include openvz::server
}
</pre>

### Setup OpenVZ hardware node with template

<pre>
node "openvzserver.my.domain" {
	include openvz::server
	include openvz::templates::getCentOS_6_x86_64
}
</pre>

# Author

written by Daniel Werdermann dwerdermann@web.de

