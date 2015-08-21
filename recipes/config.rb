#
# Cookbook Name:: neo4j
# Recipe:: config
#
# Copyright (c) 2015 Chris Zeeb <chris.zeeb@gmail.com>
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

# Template for /etc/neo4j/neo4j-server.properties
template ::File.join(node['neo4j']['conf_dir'], 'neo4j-server.properties') do
  source 'neo4j-server.properties.erb'
  owner node['neo4j']['user']
  group node['neo4j']['group']
  mode '0644'
  backup node['neo4j']['chef_backup']
  variables(:config => node['neo4j']['config']['neo4j-server.properties'])
  notifies :restart, 'service[neo4j]', :delayed if node['neo4j']['notify_restart']
end

# Template for /etc/neo4j/neo4j.properties
template ::File.join(node['neo4j']['conf_dir'], 'neo4j.properties') do
  source 'neo4j.properties.erb'
  owner node['neo4j']['user']
  group node['neo4j']['group']
  mode '0644'
  backup node['neo4j']['chef_backup']
  variables(:config => node['neo4j']['config']['neo4j.properties'])
  notifies :restart, 'service[neo4j]', :delayed if node['neo4j']['notify_restart']
end

# Template for /etc/neo4j/neo4j-wrapper.conf
template ::File.join(node['neo4j']['conf_dir'], 'neo4j-wrapper.conf') do
  source 'neo4j-wrapper.conf.erb'
  owner node['neo4j']['user']
  group node['neo4j']['group']
  mode '0644'
  backup node['neo4j']['chef_backup']
  variables(:config => node['neo4j']['config']['neo4j-wrapper.conf'])
  notifies :restart, 'service[neo4j]', :delayed if node['neo4j']['notify_restart']
end

# Template for /etc/neo4j/logging.properties
template ::File.join(node['neo4j']['conf_dir'], 'logging.properties') do
  source 'logging.properties.erb'
  owner node['neo4j']['user']
  group node['neo4j']['group']
  mode '0644'
  variables(:config => node['neo4j']['config']['logging.properties'])
  notifies :restart, 'service[neo4j]', :delayed if node['neo4j']['notify_restart']
end

include_recipe 'neo4j::service'
