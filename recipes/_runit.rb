#
# Cookbook Name:: fieri
# Recipe:: _runit
#
# Copyright 2014 Chef Software, Inc.
#

include_recipe 'runit'

directory '/etc/service' do
  mode 0755
  recursive true
end

%w(unicorn sidekiq).each do |name|
  runit_service name do
    default_logger true
  end
end
