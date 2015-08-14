
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
default['neo4j']['data_dir'] = ::File.join(node['neo4j']['home_dir'], 'data', 'graph.db')
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
