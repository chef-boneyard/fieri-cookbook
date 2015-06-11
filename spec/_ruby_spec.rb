# encoding: utf-8
require 'chefspec'
require 'spec_helper'
require 'fauxhai'

describe 'fieri::_ruby' do
  
  context 'ubuntu' do
    before{ Fauxhai.mock(platform: 'ubuntu', version: '12.04') }
    let(:chef_run) do
      ChefSpec::SoloRunner.new do |node|
        stub_command("git --version >/dev/null").and_return('1.7.1')
      end.converge(described_recipe)
    end

    it 'installs dep package libxslt-dev' do
      expect(chef_run).to install_package('libxslt-dev')
    end

    it 'installs dep package libxml2-dev' do
      expect(chef_run).to install_package('libxml2-dev')
    end


    it 'installs gem bundler package' do
      expect(chef_run).to install_gem_package('bundler')
    end
  end

  context 'centos' do
    before{ Fauxhai.mock(platform: 'centos', version: '6.5') }
    let(:chef_run) do
      ChefSpec::SoloRunner.new do |node|
        stub_command("git --version >/dev/null").and_return('1.7.1')
      end.converge(described_recipe)
    end

    it 'installs dep package libxml2' do
      expect(chef_run).to install_package('libxml2')
    end

    it 'installs dep package libxml2-devel' do
      expect(chef_run).to install_package('libxml2-devel')
    end

    it 'installs dep package libxslt' do
      expect(chef_run).to install_package('libxslt')
    end

    it 'installs dep package libxslt-devel' do
      expect(chef_run).to install_package('libxslt-devel')
    end

    it 'installs gem bundler package' do
      expect(chef_run).to install_gem_package('bundler')
    end
  end
end