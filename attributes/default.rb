# encoding: utf-8
#
# Cookbook Name:: consul
# Attributes:: default
#
# Copyright (C) 2014, Darron Froese <darron@froese.org>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default['consul']['filename'] = '0.2.0_linux_amd64.zip'
default['consul']['url'] = "https://dl.bintray.com/mitchellh/consul/#{default['consul']['filename']}"
default['consul']['checksum'] = '2802ce8e173ee37e1a1e992ba230963e09d4b41ce4ac60c1222714c036787b4f'
default['consul']['tmp'] = "/tmp/#{default['consul']['filename']}"
default['consul']['destination'] = '/usr/local/bin/consul'

default['web_ui']['filename'] = '0.2.0_web_ui.zip'
default['web_ui']['url'] = "https://dl.bintray.com/mitchellh/consul/#{default['web_ui']['filename']}"
default['web_ui']['tmp'] = "/tmp/#{default['web_ui']['filename']}"
default['web_ui']['destination'] = '/var/consul_web_ui'

default['consul']['config_path'] = '/etc/consul'
default['consul']['config_d_dir'] = '/etc/consul/config.d'
default['consul']['data_dir'] = '/var/cache/consul'

default['consul']['config_file_path'] = "#{node['consul']['config_path']}/config.json"

default['consul']['datacenter'] = 'dc1'
default['consul']['log_level'] = 'INFO'
default['consul']['node_name'] = 'consul-random-name'
default['consul']['bind_addr'] = '0.0.0.0'
default['consul']['advertise_addr'] = '127.0.0.1' # Change me.
default['consul']['domain'] = 'consul.'
default['consul']['encrypt'] = 'p4T1eTQtKji/Df3VrMMLzg==' # Change me.
default['consul']['recursor'] = '8.8.8.8'
default['consul']['server'] = true
default['consul']['bootstrap'] = true

# If you want to enable RPC encryption, change these defaults
# And read more here: http://www.consul.io/docs/agent/encryption.html
#
# default['consul']['key_file'] = "#{node['consul']['config_path']}/key.key"
# default['consul']['cert_file'] = "#{node['consul']['config_path']}/cert.crt"
# default['consul']['ca_file'] = "#{node['consul']['config_path']}/ca.key"
# default['consul']['verify_outgoing'] = true
# default['consul']['verify_incoming'] = true

default['jq']['url'] = 'http://stedolan.github.io/jq/download/linux64/jq'
default['jq']['path'] = '/usr/bin/jq'
