# encoding: utf-8
require 'chefspec'
require 'spec_helper'
require 'fauxhai'

describe 'fieri::_ruby' do
  context 'centos' do
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

    it 'links erb' do
      link = chef_run.link('/usr/bin/erb')
      expect(link).to link_to('/opt/rubies/ruby-2.0.0-p594/bin/erb')
    end

    it 'links gem' do
      link = chef_run.link('/usr/bin/gem')
      expect(link).to link_to('/opt/rubies/ruby-2.0.0-p594/bin/gem')
    end

    it 'links irb' do
      link = chef_run.link('/usr/bin/irb')
      expect(link).to link_to('/opt/rubies/ruby-2.0.0-p594/bin/irb')
    end

    it 'links rake' do
      link = chef_run.link('/usr/bin/rake')
      expect(link).to link_to('/opt/rubies/ruby-2.0.0-p594/bin/rake')
    end

    it 'links rdoc' do
      link = chef_run.link('/usr/bin/rdoc')
      expect(link).to link_to('/opt/rubies/ruby-2.0.0-p594/bin/rdoc')
    end

    it 'links ri' do
      link = chef_run.link('/usr/bin/ri')
      expect(link).to link_to('/opt/rubies/ruby-2.0.0-p594/bin/ri')
    end

    it 'links ruby' do
      link = chef_run.link('/usr/bin/ruby')
      expect(link).to link_to('/opt/rubies/ruby-2.0.0-p594/bin/ruby')
    end

    it 'links testrb' do
      link = chef_run.link('/usr/bin/testrb')
      expect(link).to link_to('/opt/rubies/ruby-2.0.0-p594/bin/testrb')
    end

    it 'links bundle' do
      link = chef_run.link('/usr/bin/bundle')
      expect(link).to link_to('/opt/rubies/ruby-2.0.0-p594/bin/bundle')
    end

    it 'links bundler' do
      link = chef_run.link('/usr/bin/bundler')
      expect(link).to link_to('/opt/rubies/ruby-2.0.0-p594/bin/bundler')
    end
  end

  context 'ubuntu' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '12.04') do |node|
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

        it 'links erb' do
      link = chef_run.link('/usr/bin/erb')
      expect(link).to link_to('/opt/rubies/ruby-2.0.0-p594/bin/erb')
    end

    it 'links gem' do
      link = chef_run.link('/usr/bin/gem')
      expect(link).to link_to('/opt/rubies/ruby-2.0.0-p594/bin/gem')
    end
    
    it 'links irb' do
      link = chef_run.link('/usr/bin/irb')
      expect(link).to link_to('/opt/rubies/ruby-2.0.0-p594/bin/irb')
    end

    it 'links rake' do
      link = chef_run.link('/usr/bin/rake')
      expect(link).to link_to('/opt/rubies/ruby-2.0.0-p594/bin/rake')
    end

    it 'links rdoc' do
      link = chef_run.link('/usr/bin/rdoc')
      expect(link).to link_to('/opt/rubies/ruby-2.0.0-p594/bin/rdoc')
    end

    it 'links ri' do
      link = chef_run.link('/usr/bin/ri')
      expect(link).to link_to('/opt/rubies/ruby-2.0.0-p594/bin/ri')
    end

    it 'links ruby' do
      link = chef_run.link('/usr/bin/ruby')
      expect(link).to link_to('/opt/rubies/ruby-2.0.0-p594/bin/ruby')
    end

    it 'links testrb' do
      link = chef_run.link('/usr/bin/testrb')
      expect(link).to link_to('/opt/rubies/ruby-2.0.0-p594/bin/testrb')
    end

    it 'links bundle' do
      link = chef_run.link('/usr/bin/bundle')
      expect(link).to link_to('/opt/rubies/ruby-2.0.0-p594/bin/bundle')
    end

    it 'links bundler' do
      link = chef_run.link('/usr/bin/bundler')
      expect(link).to link_to('/opt/rubies/ruby-2.0.0-p594/bin/bundler')
    end
  end
end