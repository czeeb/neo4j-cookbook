#
# Cookbook Name:: neo4j
# Recipe:: java
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

if node['neo4j']['install_java']
  # Java attributes to meet minimum requirement.
  node.default['java']['jdk_version'] = '7'
  node.default['java']['install_flavor'] = 'oracle'
  node.default['java']['set_default'] = true
  node.default['java']['arch'] = node['kernel']['machine']
  node.default['java']['oracle']['accept_oracle_download_terms'] = true

  include_recipe 'apt' if node['platform_family'] == 'debian'
  include_recipe 'java::default'
end
