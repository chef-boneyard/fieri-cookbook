# encoding: utf-8
require 'chefspec'
require 'spec_helper'
require 'fauxhai'

describe 'fieri::_nginx' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new do |node|
    	stub_command("which nginx").and_return('/etc/nginx')
    end.converge(described_recipe)
  end

  it 'includes nginx recipe' do
    expect(chef_run).to include_recipe('nginx::default')
  end

  it 'creates nginx template' do
    expect(chef_run).to create_template('/etc/nginx/sites-available/default')
    resource = chef_run.template('/etc/nginx/sites-available/default')
    expect(resource).to notify('service[nginx]').to(:restart).immediately
  end

  it 'nginx does nothing' do
    expect(chef_run).to_not restart_service('nginx')
  end
end