#
# Cookbook Name:: masala_cassandra
# Recipe:: cron
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

cron "logrotate_cassandra_repair" do
  minute "0"
  hour node['masala_cassandra']['repair_cron_hour']
  # Upstream recipe doesn't set installation_dir correctly, hardcode it
  #command "#{node.cassandra.installation_dir}/bin/nodetool repair 2>1 > #{node.cassandra.log_dir}/repair.log"
  command "/usr/bin/nodetool repair 2>1 > #{node.cassandra.log_dir}/repair.log"
  user node.cassandra.user
end

logrotate_app 'cassandra-repair' do
  path      '/var/log/cassandra/repair.log'
  frequency 'daily'
  options   ['missingok', 'delaycompress', 'notifempty']
  rotate    7
  create    "644 #{node.cassandra.user} #{node.cassandra.group}"
end
