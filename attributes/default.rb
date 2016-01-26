
# Chef recipe vars, not cassandra itself here, see below for C* yaml
default['cassandra']['install_method'] = 'datastax'
default['cassandra']['install_java'] = false
default['cassandra']['notify_restart'] = true
default['cassandra']['version'] = '2.1.9'

# jvm
default['cassandra']['max_heap_size'] = nil
default['cassandra']['heap_new_size'] = nil
default['cassandra']['xss'] = '256k'
# GC tuning options
default['cassandra']['gc_survivor_ratio'] = 8
default['cassandra']['gc_max_tenuring_threshold'] = 1
default['cassandra']['gc_cms_initiating_occupancy_fraction'] = 75


# direct conf file items
default['cassandra']['config']['disk_failure_policy'] = 'stop_paranoid' # options: stop,best_effort,ignore
default['cassandra']['config']['auto_snapshot'] = false
default['cassandra']['config']['read_request_timeout_in_ms'] = 5_000
default['cassandra']['config']['write_request_timeout_in_ms'] = 20_000

# The recommended Value is 16 to 32 times the rate of write throughput (in MB/second)
# Needs tuning based on performance indicators
default['cassandra']['config']['compaction_throughput_mb_per_sec'] = 16

default['cassandra']['config']['endpoint_snitch'] = 'GossipingPropertyFileSnitch'

# directories
default['cassandra']['config']['saved_caches_directory'] = '/cassandra/saved_caches'
default['cassandra']['config']['commitlog_directory'] = '/cassandra/commitlog'

# TODO: add when opcentre is
default['cassandra']['opscenter']['version'] = nil
default['cassandra']['opscenter']['server']['package_name'] = 'opscenter'
default['cassandra']['opscenter']['server']['port'] = '8888'
default['cassandra']['opscenter']['server']['interface'] = '0.0.0.0'
default['cassandra']['opscenter']['server']['authentication'] = false

default['cassandra']['opscenter']['agent']['package_name'] = 'datastax-agent'
default['cassandra']['opscenter']['agent']['download_url'] = nil
default['cassandra']['opscenter']['agent']['checksum'] = nil
default['cassandra']['opscenter']['agent']['install_dir'] = '/opt'
default['cassandra']['opscenter']['agent']['install_folder_name'] = 'opscenter_agent'
default['cassandra']['opscenter']['agent']['binary_name'] = 'opscenter-agent'
default['cassandra']['opscenter']['agent']['server_host'] = nil # if nil, will use search to get IP by server role
default['cassandra']['opscenter']['agent']['use_chef_search'] = false
default['cassandra']['opscenter']['agent']['server_role'] = 'opscenter_server'
default['cassandra']['opscenter']['agent']['use_ssl'] = true
default['cassandra']['opscenter']['agent']['conf_dir'] = '/var/lib/datastax-agent/conf'

