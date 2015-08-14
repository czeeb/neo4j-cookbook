#
# Cookbook Name:: neo4j
# Recipe:: service
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

service_provider = case node['platform_family']
                   when 'debian'
                     if node['platform'] == 'debian' && node['platform_version'].to_f >= 8
                       Chef::Provider::Service::Systemd
                     end
                   end

service 'neo4j' do
  service_name 'neo4j-service' if node['platform_family'] == 'debian'
  action [:enable, :start]
  supports :restart => true
  provider service_provider if node['neo4j']['install_method'] == 'package'
end
