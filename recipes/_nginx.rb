#
# Cookbook Name:: fieri
# Recipe:: _nginx
#
# Copyright 2014 Chef Software, Inc.
#

include_recipe 'nginx'

template '/etc/nginx/sites-available/fieri' do
  source 'fieri.nginx.erb'
  notifies :restart, 'service[nginx]', :immediately
end

link '/etc/nginx/sites-enabled/fieri' do
  to '/etc/nginx/sites-available/fieri'
  notifies :restart, 'service[nginx]'
end

service 'nginx' do
  action :nothing
end
