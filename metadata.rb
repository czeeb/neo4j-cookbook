name             'neo4j'
maintainer       'Chris Zeeb'
maintainer_email 'chris.zeeb@gmail.com'
license          'Apache 2.0'
description      'Installs/Configures neo4j'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
issues_url       'https://github.com/czeeb/neo4j-cookbook/issues'
version          '0.1.0'

supports 'debian', '>= 7.8'
supports 'ubuntu', '>= 12.04'

supports 'centos'
supports 'amazon'
supports 'redhat'

depends 'yum', '~> 3.2.0'
depends 'apt', '~> 2.7.0'
depends 'java', '~> 1.31.0'
