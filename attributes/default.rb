
default['neo4j']['release'] = '2.2.4'
default['neo4j']['release_suffix'] = node['platform_family'] == 'rhel' ? '-1' : ''
default['neo4j']['edition'] = 'community' # options: community, enterprise
default['neo4j']['install_java']    = true
default['neo4j']['install_method']  = 'package' # options: package, tarball
default['neo4j']['package'] = node['neo4j']['edition'] == 'community' ? 'neo4j' : 'neo4j-' + node['neo4j']['edition']

# tarball sources
default['neo4j']['tarball_url'] = "http://neo4j.com/artifact.php?name=neo4j-#{node['neo4j']['edition']}-#{node['neo4j']['release']}-unix.tar.gz"
default['neo4j']['tarball_checksum']['2.2.4']['community']  = 'b3fa5d547e50c3f619e39290266979e72f7222be7644fbb3bad2fc31d074aab9'
default['neo4j']['tarball_checksum']['2.2.4']['enterprise'] = 'fc75a9cb161e9704ee0059e828f135637e17493328a783d979f3d6ead7fd86bf'

default['neo4j']['tarball_checksum']['2.2.5']['community'] = '7fadc119f465a3d6adceb610401363fb158a5ed25081f9893d4f56ac4989a998'
default['neo4j']['tarball_checksum']['2.2.5']['enterprise'] = 'c7ddd390ddd5d2ac347c505e83f7a2707abda8b7e92f70b1f2f8d4d53f68f7af'

default['neo4j']['tarball_checksum']['2.2.6']['community'] = '77f8371318c843bdd8fbd5f95be95e9a1467bb84030d4a3ff9dcec805b4003b9'
default['neo4j']['tarball_checksum']['2.2.6']['enterprise'] = '73c55c5a5f69fe4bc3d93c8df88c8001d3d474bfe7e4eacb3e680c99d33ef407'

default['neo4j']['tarball_checksum']['2.2.7']['community'] = '79d96471a5e8aa08ae2a7d78b0a2ff6d587fe13125205a9a4dc9705766e1cd25'
default['neo4j']['tarball_checksum']['2.2.7']['enterprise'] = '13de7a0cbc1205bbeeb0e1ffa0797ded8f9da6304953f0339f4512b34ee8284e'

default['neo4j']['tarball_checksum']['2.3.0']['community'] = '88fee93884700dae6a1f870dd84b3da9d094db33d57db1c88904954ef2cb4830'
default['neo4j']['tarball_checksum']['2.3.0']['enterprise'] = '0d3f370f8141d8bc37065f843af190c405cba098d1bb82065ffc0cb5b99950b7'

default['neo4j']['tarball_checksum']['2.3.1']['community'] = '7b2f30d73af107eacd9a3a619475ef448a08eecb2cdb42ab1f8a38d091c70ecb'
default['neo4j']['tarball_checksum']['2.3.1']['enterprise'] = '93f0950b0c3a5a604f80183814b7cda2988a652e9278159c47d036daa96e3d29s'

default['neo4j']['tarball_checksum']['2.3.2']['community'] = '37e24d95c914c54d5cbbe99473d4beef89da78adb2db04eb87258a489225932a'
default['neo4j']['tarball_checksum']['2.3.2']['enterprise'] = 'ea80cfca918dd70ea5d10a125f5c3a5be02e45dd497b67dfa2d22770a891acea'

default['neo4j']['tarball_checksum']['2.3.3']['community'] = '01559c55055516a42ee2dd100137b6b55d63f02959a3c6c6db7a152e045828d9'
default['neo4j']['tarball_checksum']['2.3.3']['enterprise'] = '864b7ebef3a12844c809e75016aa951c60ac90fb0d075a595108824859ce7875'

# tarball install directory locations
default['neo4j']['parent_dir']  = '/usr/local/neo4j'
default['neo4j']['install_dir'] = ::File.join(node['neo4j']['parent_dir'], 'neo4j')
default['neo4j']['source_dir']  = ::File.join(node['neo4j']['parent_dir'], "neo4j-#{node['neo4j']['edition']}-#{node['neo4j']['release']}")

default['neo4j']['service_action'] = [:enable, :start]
default['neo4j']['notify_restart'] = true

# cookbook for configuration files template resources
default['neo4j']['cookbook'] = 'neo4j'

default['neo4j']['chef_backup'] = 5

default['neo4j']['user']        = 'neo4j'
default['neo4j']['user_group']  = node['platform_family'] == 'rhel' ? 'neo4j' : 'nogroup'
default['neo4j']['group']       = node['platform_family'] == 'rhel' ? 'neo4j' : 'adm'
default['neo4j']['setup_user']  = true # for tarball install

default['neo4j']['log_dir']   = '/var/log/neo4j'
default['neo4j']['home_dir']  = case node['neo4j']['install_method']
                                when 'package'
                                  value_for_platform_family(
                                    'debian' => '/var/lib/neo4j',
                                    'rhel' => '/usr/share/neo4j'
                                  )
                                else
                                  node['neo4j']['install_dir']
                                end

# this works for both package and tarball
default['neo4j']['conf_dir'] = ::File.join(node['neo4j']['home_dir'], 'conf')
default['neo4j']['data_dir'] = value_for_platform_family(
  'debian' => ::File.join(node['neo4j']['home_dir'], 'data', 'graph.db'),
  'rhel' => '/var/lib/neo4j'
)

default['neo4j']['pid_file'] = ::File.join(node['neo4j']['home_dir'], 'data', 'neo4j-service.pid')
default['neo4j']['auth_dir'] = ::File.join(node['neo4j']['home_dir'], 'data', 'dbms')
default['neo4j']['auth_file'] = ::File.join(node['neo4j']['auth_dir'], 'auth')

default['neo4j']['umask'] = '0022'
default['neo4j']['mode']  = '0755'

default['neo4j']['initd_file'] = value_for_platform_family(
  'debian' => '/etc/init.d/neo4j-service',
  'rhel' => '/etc/init.d/neo4j'
)

default['neo4j']['limits']['files'] = 48_000
