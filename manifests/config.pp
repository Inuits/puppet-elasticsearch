# Class: elasticsearch
#
# This module manages elasticsearch
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
# [Remember: No empty lines between comments and class definition]
class elasticsearch::config($es_clustername = $::elasticsearch::params::es_clustername){

  require elasticsearch::params

  file { '/etc/elasticsearch/':
    ensure  => 'directory',
    group   => '0',
    mode    => '0755',
    owner   => '0',
  }

  file { '/etc/elasticsearch/elasticsearch.yml':
    group   => '0',
    mode    => '0644',
    owner   => '0',
    content => template("${module_name}/elasticsearch.yaml.erb"),
    require => File['/etc/elasticsearch'],
  }


}

