#
# Cookbook Name:: fieri
# Recipe:: _users
#
# Copyright 2014 Chef Software, Inc.
#

group 'fieri' do
  system true
end

user 'fieri' do
  gid 'fieri'
  system true
  home node['fieri']['home']
  comment 'Fieri'
  shell '/bin/bash'
end

%w( shared shared/bundle ).each do |dir|
  directory "#{node['fieri']['home']}/#{dir}" do
    user 'fieri'
    group 'fieri'
    mode 0755
    recursive true
  end
end

file ::File.join(node['fieri']['home'], '.gemrc') do
  content 'gem: --no-ri --no-rdoc --bindir /usr/bin'
end

directory '/var/run/fieri/' do
  user 'fieri'
  group 'fieri'
  mode 0755
  recursive true
end
