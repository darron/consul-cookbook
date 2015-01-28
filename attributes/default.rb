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

default['consul']['filename'] = 'consul-0.5rc1-amd64.zip'
default['consul']['url'] = 'http://shared.froese.org/2015/consul-0.5rc1-amd64.zip'
# default['consul']['checksum'] = '2cf6e59edf348c3094c721eb77436e8c789afa2c35e6e3123a804edfeb1744ac'
default['consul']['tmp'] = "/tmp/#{default['consul']['filename']}"
default['consul']['destination'] = '/usr/local/bin/consul'

default['web_ui']['filename'] = '0.4.1_web_ui.zip'
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
default['consul']['start_join'] = ['0.0.0.0']

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
