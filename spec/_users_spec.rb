# encoding: utf-8
require 'chefspec'
require 'spec_helper'
require 'fauxhai'

describe 'fieri::_users' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new do |node|
    end.converge(described_recipe)
  end

  it 'creates fieri group' do
    expect(chef_run).to create_group('fieri')
  end

  it 'creates fieri user' do
    expect(chef_run).to create_user('fieri')
  end

  it 'creates bundle dirs' do
    expect(chef_run).to create_directory('/srv/fieri/shared')
    expect(chef_run).to create_directory('/srv/fieri/shared/bundle')
  end

  it 'creates .gemrc file' do
    expect(chef_run).to create_file('/srv/fieri/.gemrc')
  end
end