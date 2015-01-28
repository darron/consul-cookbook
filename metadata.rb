# encoding: utf-8
name             'consul'
maintainer       'Darron Froese'
maintainer_email 'darron@froese.org'
license          'Apache 2.0'
description      'Installs/configures consul'
version          '1.0.0'
recipe           'consul::default', 'Installs/configures consul'

depends 'apt'
depends 'ark'
depends 'chef-sugar'
