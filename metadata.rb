name             'fieri'
maintainer       'Chef Supermarket Team'
maintainer_email 'supermarket@getchef.com'
license          'Apache 2.0'
description      'Installs/Configures fieri'
long_description 'Installs/Configures fieri'
version          '0.2.0'

depends          'apt'
depends          'git'
depends          'nginx'
depends 'redisio', '~> 1.7.1' # Versions > 1 use different recipes
depends 'ruby_install', '~> 1.0.2' # Versions > 1.0.2 have a bug in for ubuntu 12.04
depends          'rubies'
depends          'runit'
depends          'xml'

supports 'ubuntu'
supports 'centos'
