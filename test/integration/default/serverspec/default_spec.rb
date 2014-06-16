# encoding: utf-8
require 'spec_helper'

# Write integration tests with Serverspec - http://serverspec.org/
describe 'consul::default' do
  describe package('unzip') do
    it { should be_installed }
  end

  describe package('curl') do
    it { should be_installed }
  end

  describe file('/etc/consul') do
    it { should be_directory }
  end

  describe file('/etc/consul/config.d') do
    it { should be_directory }
  end

  describe file('/var/cache/consul') do
    it { should be_directory }
  end

  describe file('/etc/init/consul.conf') do
    it { should be_file }
  end

  describe file('/etc/init.d/consul') do
    it { should be_file }
  end

  describe file('/etc/consul/config.json') do
    it { should be_file }
  end

  describe file('/etc/default/consul') do
    it { should be_file }
  end

  describe file('/usr/local/bin/consul') do
    it { should be_file }
  end

  describe file('/usr/bin/jq') do
    it { should be_file }
  end

  describe service('consul') do
    it { should be_enabled }
    it { should be_running }
  end

  describe port(8300) do
    it { should be_listening }
  end

  describe port(8400) do
    it { should be_listening }
  end

  describe port(8500) do
    it { should be_listening }
  end

  describe file('/var/consul_web_ui/index.html') do
    it { should be_file }
  end
end
