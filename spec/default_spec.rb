# encoding: utf-8
require 'spec_helper'

# Write unit tests with ChefSpec - https://github.com/sethvargo/chefspec#readme
describe 'consul::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'installs the unzip package' do
    expect(chef_run).to install_package('unzip')
  end

  it 'creates the config path' do
    expect(chef_run).to create_directory('/etc/consul')
  end

  it 'creates the config.d path' do
    expect(chef_run).to create_directory('/etc/consul/config.d')
  end

  it 'creates the data_dir' do
    expect(chef_run).to create_directory('/var/cache/consul')
  end

  it 'creates the init/consul.conf file' do
    expect(chef_run).to create_template('/etc/init/consul.conf')
  end

  it 'creates the init.d/consul symlink' do
    expect(chef_run).to create_link('/etc/init.d/consul')
  end

  it 'creates the config file' do
    expect(chef_run).to create_template('/etc/consul/config.json')
  end

  it 'enables and starts the service' do
    expect(chef_run).to enable_service('consul')
    expect(chef_run).to start_service('consul')
  end

end
