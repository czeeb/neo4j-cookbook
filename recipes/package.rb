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

case node['platform_family']
when 'debian'
  include_recipe 'apt'
  # apt repository configuration
  apt_repository 'neo4j' do
    uri node['neo4j']['apt']['uri']
    components node['neo4j']['apt']['components']
    key node['neo4j']['apt']['key']
    action node['neo4j']['apt']['action']
  end
when 'rhel'
  # yum repository configuration
  yum_repository 'neo4j' do
    description node['neo4j']['yum']['description']
    baseurl node['neo4j']['yum']['baseurl']
    mirrorlist node['neo4j']['yum']['mirrorlist']
    gpgcheck node['neo4j']['yum']['gpgcheck']
    gpgkey node['neo4j']['yum']['gpgkey']
    enabled node['neo4j']['yum']['enabled']
    action node['neo4j']['yum']['action']
  end
end

package node['neo4j']['package'] do
  version node['neo4j']['release'] + node['neo4j']['release_suffix']
end
