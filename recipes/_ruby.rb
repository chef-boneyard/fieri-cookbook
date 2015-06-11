#
# Cookbook Name:: fieri
# Recipe:: _ruby
#
# Copyright 2014 Chef Software, Inc.
#

node.default['rubies']['list']                 = ['ruby 2.0.0-p594']
node.default['rubies']['bundler']['install']   = false
node.default['chruby_install']['default_ruby'] = true

include_recipe 'rubies'

# package 'ruby2.0'
# package 'ruby2.0-dev'
%w(erb gem irb rake rdoc ri ruby testrb bundle bundler).each do |rb|
  link "/usr/bin/#{rb}" do
    to "/opt/rubies/ruby-2.0.0-p594/bin/#{rb}"
  end
end

node['fieri']['gem']['dep_packages'].each do |pkg|
  package pkg
end

gem_package 'bundler' do
  gem_binary '/opt/rubies/ruby-2.0.0-p594/bin/gem'
  version '>= 1.7.3'
end
