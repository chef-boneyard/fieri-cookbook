# encoding: utf-8
require 'chefspec'
require 'spec_helper'
require 'fauxhai'

describe 'fieri::_application' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new do |node|
      stub_data_bag_item("apps", "fieri").and_return({
      	  :id => "fieri",
          :foodcritic_fail_tags => "any",
          :results_endpoint => "https://supermarket.getchef.com/api/v1/cookbook-verisons/evaluation",
          :auth_token => "someAuthToken",
          :sentry_url => "test"
      	})
      stub_command("git --version >/dev/null").and_return('test')
    end.converge(described_recipe)
  end

  it 'includes git recipe' do
    expect(chef_run).to include_recipe('git')
  end

  it 'includes xml recipe' do
    expect(chef_run).to include_recipe('xml')
  end

  it 'includes ruby recipe' do
    expect(chef_run).to include_recipe('fieri::_ruby')
  end

  it 'includes runit recipe' do
    expect(chef_run).to include_recipe('fieri::_runit')
  end

  it 'creates env file' do
    expect(chef_run).to create_file('/srv/fieri/shared/env')
  end

  it 'deploys unicorn template' do
    expect(chef_run).to create_template('/srv/fieri/shared/unicorn.rb')
  end
end