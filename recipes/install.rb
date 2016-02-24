#
# Cookbook Name:: neo4j
# Recipe:: install
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

raise "invalid value `#{node['neo4j']['install_method']}` for `node['neo4j']['install_method']`, valid are `package tarball`" unless %w(package tarball).include?(node['neo4j']['install_method'])

raise "invalid value `#{node['neo4j']['edition']}` for `node['neo4j']['edition']`, valid are `community enterprise`" unless %w(community enterprise).include?(node['neo4j']['edition'])

include_recipe 'neo4j::java'

# dir resources here
include_recipe "neo4j::#{node['neo4j']['install_method']}"

[node['neo4j']['log_dir'],
 node['neo4j']['auth_dir'],
 node['neo4j']['data_dir']
].each do |dir|
  directory dir do
    owner node['neo4j']['user']
    group node['neo4j']['group']
    mode node['neo4j']['mode']
    recursive true
  end
end
