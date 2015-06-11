# encoding: utf-8
require 'chefspec'
require 'spec_helper'
require 'fauxhai'

describe 'fieri::_application' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new do |node|
      stub_data_bag_item("apps", "fieri").and_return({map: "test"})
    end.converge(described_recipe)
  end

  it 'includes git recipe' do
    expect(chef_run).to include_recipe('git')
  end
end