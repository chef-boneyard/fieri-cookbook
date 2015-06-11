# encoding: utf-8
require 'chefspec'
require 'spec_helper'
require 'fauxhai'

describe 'fieri::_ruby' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new do |node|
    	node.default['rubies']['list']                 = ['ruby 2.0.0-p594']
      node.default['rubies']['bundler']['install']   = false
      node.default['chruby_install']['default_ruby'] = true
      node['fieri']['gem']['dep_packages']           = ['test']
    end.converge(described_recipe)
  end

  it 'installs dep package' do
    expect(chef_run).to install_package('test')
  end

  it 'installs gem bundler package' do
    expect(chef_run).to install_gem_package('bundler')
  end
end