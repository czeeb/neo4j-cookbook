name             'neo4j'
maintainer       'Chris Zeeb'
maintainer_email 'chris.zeeb@gmail.com'
license          'Apache 2.0'
description      'Installs/Configures neo4j'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

supports 'debian', '>= 7'
supports 'ubuntu', '>= 12.04'

depends 'apt', '~> 2.7.0'
depends 'java', '~> 1.31.0'
