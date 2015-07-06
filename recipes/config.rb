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
include_recipe 'neo4j::service'

# Template for /etc/neo4j/neo4j-server.properties
template '/etc/neo4j/neo4j-server.properties' do
  action :create
  source 'neo4j-server.properties.erb'
  owner 'neo4j'
  group 'adm'
  mode '0644'
  notifies :restart, 'service[neo4j-service]', :delayed
end
