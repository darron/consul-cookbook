# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "opscode-ubuntu-12.04"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network :private_network, ip: "192.168.62.86"

  # Install: vagrant plugin install vagrant-omnibus
  config.omnibus.chef_version = :latest
  
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "./vendor/cookbooks"
    chef.add_recipe "consul"
  end
end
