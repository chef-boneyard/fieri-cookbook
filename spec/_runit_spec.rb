# encoding: utf-8
require 'chefspec'
require 'spec_helper'
require 'fauxhai'

describe 'fieri::_runit' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new do |node|
    end.converge(described_recipe)
  end

  it 'includes runit recipe' do
    expect(chef_run).to include_recipe('runit')
  end

  it 'creates directory' do
    expect(chef_run).to create_directory('/etc/service')
  end

  it 'enables unicorn and sidekiq' do
    expect(chef_run).to enable_runit_service('unicorn')
    expect(chef_run).to enable_runit_service('sidekiq')
  end
end