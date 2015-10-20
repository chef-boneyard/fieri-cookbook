name             'fieri'
maintainer       'Chef Supermarket Team'
maintainer_email 'supermarket@chef.io'
license          'Apache 2.0'
description      'Installs/Configures fieri'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.1'

depends          'apt'
depends          'git'
depends          'redisio'
depends          'xml'

supports         'ubuntu'

source_url 'https://github.com/chef-cookbooks/fieri' if respond_to?(:source_url)
issues_url 'https://github.com/chef-cookbooks/fieri/issues' if respond_to?(:issues_url)
