
default['neo4j']['yum']['description'] = 'Neo4j Repository'
default['neo4j']['yum']['gpgcheck'] = true
default['neo4j']['yum']['enabled'] = true
default['neo4j']['yum']['baseurl'] = 'http://yum.neo4j.org'
default['neo4j']['yum']['gpgkey'] = 'http://debian.neo4j.org/neotechnology.gpg.key'
default['neo4j']['yum']['mirrorlist'] = nil
default['neo4j']['yum']['action'] = :create

default['neo4j']['apt']['description'] = 'Neo4j Repository'
default['neo4j']['apt']['components'] = ['stable/']
default['neo4j']['apt']['action'] = :add
default['neo4j']['apt']['uri'] = 'http://debian.neo4j.org/repo'
default['neo4j']['apt']['key'] = 'http://debian.neo4j.org/neotechnology.gpg.key'
