#
# Cookbook Name:: neo4j
# Recipe:: tarball
#
# Copyright 2015, Virender Khatri
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'neo4j::user'

[node['neo4j']['parent_dir']
].each do |dir|
  directory dir do
    owner node['neo4j']['user']
    group node['neo4j']['group']
    mode node['neo4j']['mode']
    recursive true
  end
end

tarball_file = ::File.join(node['neo4j']['parent_dir'], "neo4j-#{node['neo4j']['edition']}-#{node['neo4j']['release']}-unix.tar.gz")

# stop neo4j service if running for upgrade
service 'neo4j' do
  service_name 'neo4j-service' if node['platform_family'] == 'debian'
  action :stop
  only_if { ::File.exist?(node['neo4j']['initd_file']) && !File.exist?(node['neo4j']['source_dir']) }
end

# bin/neo4j requires lsof which isn't always installed
package 'lsof' do
  action :install
end

# download tarball
remote_file tarball_file do
  source node['neo4j']['tarball_url']
  checksum node['neo4j']['tarball_checksum'][node['neo4j']['release']][node['neo4j']['edition']]
  owner node['neo4j']['user']
  group node['neo4j']['group']
  not_if { ::File.exist?(::File.join(node['neo4j']['source_dir'], 'bin', 'neo4j')) }
end

# extract tarball
execute 'extract_neo4j_tarball' do
  user node['neo4j']['user']
  group node['neo4j']['group']
  umask node['neo4j']['umask']
  cwd node['neo4j']['parent_dir']
  command "tar xzf #{tarball_file}"
  creates ::File.join(node['neo4j']['source_dir'], 'bin', 'neo4j')
end

remote_file tarball_file do
  action :delete
end

link node['neo4j']['install_dir'] do
  to node['neo4j']['source_dir']
  notifies :restart, 'service[neo4j]', :delayed if node['neo4j']['notify_restart']
end

# initd file
template node['neo4j']['initd_file'] do
  cookbook node['neo4j']['cookbook']
  source "initd.#{node['platform_family']}.erb"
  owner 'root'
  group 'root'
  mode 0755
  notifies :restart, 'service[neo4j]', :delayed if node['neo4j']['notify_restart']
end
