source "https://supermarket.chef.io"

## Due to a design decision in berkshelf to not recursively resolve dependencies, we must declare all dependencies of our dependencies, to the full depth of the recursion

# Dependencies of masala_ldap:
cookbook 'openldap', :git => 'https://github.com/PaytmLabs/chef-openldap.git', :ref => 'feature-our-fixes'
#cookbook 'sssd_ldap', :git => 'https://github.com/PaytmLabs/chef-sssd_ldap.git', :ref => 'feature-services'
cookbook 'masala_ldap', :git => 'https://github.com/PaytmLabs/masala_ldap.git', :ref => 'develop'

# Dependencies of masala_base:
cookbook 'ixgbevf', :git => 'https://github.com/PaytmLabs/chef-ixgbevf.git', :ref => 'master'
cookbook 'system', :git => 'https://github.com/PaytmLabs/chef-system.git', :ref => 'feature-network-restart-control'
cookbook 'datadog', :git => 'https://github.com/PaytmLabs/chef-datadog.git', :ref => 'kafka-monitor-fix'
cookbook 'masala_base', :git => 'https://github.com/PaytmLabs/masala_base.git', :ref => 'develop'

## Now load the primary metadata
metadata

