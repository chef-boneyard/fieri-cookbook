# encoding: utf-8
require 'chefspec'
require 'spec_helper'
require 'fauxhai'

describe 'fieri::_users' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new do |node|
      node['fieri']['home'] = '/test'
    end.converge(described_recipe)
  end

  it 'creates fieri group' do
    expect(chef_run).to create_group('fieri')
  end

  it 'creates fieri user' do
    expect(chef_run).to create_user('fieri')
  end

  it 'creates bundle dirs' do
    expect(chef_run).to create_directory('/test/shared')
    expect(chef_run).to create_directory('/test/shared/bundle')
  end

  it 'creates .gemrc file' do
    expect(chef_run).to create_file('/test/.gemrc')
  end
end