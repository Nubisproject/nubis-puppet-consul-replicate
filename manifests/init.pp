# == Class: consul_replicate
#
# Full description of class consul_replicate here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { consul_replicate:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
#
class consul_replicate (
 $version = "0.2.0"
){

staging::file { 'consul-replicate.tar.gz':
  source => "https://github.com/hashicorp/consul-replicate/releases/download/v0.2.0/consul-replicate_$version_linux_amd64.tar.gz"
} ->
staging::extract { 'consul-replicate.tar.gz':
  strip   => 1,
  target  => "/usr/local/bin",
  creates => "/usr/local/bin/consul-replicate",
} ->
file { "/usr/local/bin/consul-replicate":
  owner =>  0,
  group =>  0,
  mode  => '0555',
}
}
