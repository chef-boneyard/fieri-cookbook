# encoding: utf-8
require 'chefspec'
require 'spec_helper'
require 'fauxhai'

describe 'fieri::default' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new do |node|
      stub_data_bag_item("apps", "fieri").and_return({map: "test"})
    end.converge(described_recipe)
  end

  it 'includes redisio::install recipe' do
    expect(chef_run).to include_recipe('redisio::install')
  end

  it 'includes redisio::enable recipe' do
    expect(chef_run).to include_recipe('redisio::enable')
  end

  it 'includes ruby recipe' do
    expect(chef_run).to include_recipe('fieri::_ruby')
  end

  it 'includes nginx recipe' do
    expect(chef_run).to include_recipe('fieri::_nginx')
  end

  it 'includes users recipe' do
    expect(chef_run).to include_recipe('fieri::_users')
  end

  it 'includes runit recipe' do
    expect(chef_run).to include_recipe('fieri::_runit')
  end

  it 'includes application recipe' do
    expect(chef_run).to include_recipe('fieri::_application')
  end
end