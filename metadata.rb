name             'neo4j'
maintainer       'Chris Zeeb'
maintainer_email 'chris.zeeb@gmail.com'
license          'Apache 2.0'
description      'Installs/Configures neo4j'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
issues_url       'https://github.com/czeeb/neo4j-cookbook/issues' if respond_to?(:issues_url)
source_url       'https://github.com/czeeb/neo4j-cookbook' if respond_to?(:source_url)
version          '1.0.6'

supports 'amazon'
supports 'centos', '>= 6.6'
supports 'debian', '>= 7.8'
supports 'redhat', '>= 6.6'
supports 'ubuntu', '>= 12.04'

depends 'apt', '~> 2.7'
depends 'java', '~> 1.31'
depends 'yum', '~> 3.2'
