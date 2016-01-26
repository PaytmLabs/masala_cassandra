#
# Cookbook Name:: masala_cassandra
# Recipe:: default
#
# Copyright 2016, Paytm Labs
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

include_recipe 'masala_base::default'

# Most other vars in the local attributes/default.rb

primary_if = node['network']['interfaces'][node['system']['primary_interface']]
primary_addrs = primary_if['addresses']
primary_addrs_ipv4 = primary_addrs.select { |_addr, attrs| attrs['family'] == 'inet' }
primary_ip = primary_addrs_ipv4.keys.first

node.set['cassandra']['config']['listen_address'] = primary_ip
node.set['cassandra']['config']['broadcast_address'] = primary_ip
node.set['cassandra']['config']['broadcast_rpc_address'] = primary_ip
node.set['cassandra']['config']['rpc_address'] = "0.0.0.0"

cpus = node['cpu']['total']
disks = node['cassandra']['data_dir'].count

node.set['cassandra']['config']['concurrent_reads'] = disks * 16
node.set['cassandra']['config']['concurrent_writes'] = cpus * 8
node.set['cassandra']['config']['concurrent_compactors'] = cpus

node.set['cassandra']['data_dir'] = ['/cassandra/data']

include_recipe 'cassandra-dse::default'

node['cassandra']['data_dir'].each do |dir|
  directory dir do
    owner node['cassandra']['user']
    group node['cassandra']['group']
    recursive true
    mode 0755
  end
end

dirs_to_make = [
  node['cassandra']['config']['commitlog_directory'],
  node['cassandra']['config']['saved_caches_directory'],
]

if node['cassandra']['config'].has_key?('hints_directory')
  dirs_to_make.push(node['cassandra']['config']['hints_directory'])
end

dirs_to_make.each do |dir|
  directory dir do
    owner node['cassandra']['user']
    group node['cassandra']['group']
    recursive true
    mode 0755
  end
end

include_recipe 'masala_cassandra::datadog'

