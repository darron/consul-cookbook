consul Cookbook
=================

Requirements
------------

### Platform:

Ubuntu 12.04LTS

### Cookbooks:

None.

Attributes
----------

```
default['consul']['filename'] = '0.1.0_linux_amd64.zip'
default['consul']['url'] = "https://dl.bintray.com/mitchellh/consul/#{default['consul']['filename']}"
default['consul']['checksum'] = '80912eb136acf5ac6ba77284138e4536cd1289870f202ed17ed67bbf2c6b630c'
default['consul']['tmp'] = "/tmp/#{default['consul']['filename']}"
default['consul']['destination'] = '/usr/local/bin/consul'

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

# These are disabled by default.

default['consul']['key_file'] = "#{node['consul']['config_path']}/key.key"
default['consul']['cert_file'] = "#{node['consul']['config_path']}/cert.crt"
default['consul']['ca_file'] = "#{node['consul']['config_path']}/ca.key"
default['consul']['verify_outgoing'] = true
default['consul']['verify_incoming'] = true
```

Recipes
-------

### consul::default

Installs [Hashicorp's Consul](http://www.consul.io/) on Ubuntu 12.04LTS.

### Packer Build

In order to build an Amazon AMI, DigitalOcean Droplet, Google Compute or Rackspace OpenStack image, you will need accounts for each. Export these values to get Packer to honor them automatically:

    # Rackspace
    export SDK_USERNAME="username"  # Same as here: https://mycloud.rackspace.com/
    export SDK_PASSWORD="password-to-login" # Not the API key.
    export SDK_PROVIDER="rackspace-us" # Or rackspace-uk

    # EC2 - can be found here: https://portal.aws.amazon.com/gp/aws/securityCredentials?
    export AWS_ACCESS_KEY="long-random-string"
    export AWS_SECRET_KEY="another-even-longer-long-random-string"

    # Digital Ocean - get these here: https://cloud.digitalocean.com/api_access
    export DIGITALOCEAN_CLIENT_ID="long-random-string"
    export DIGITALOCEAN_API_KEY="another-long-random-string"

Building images with Google Compute requires more setup than just a few ENV vars. Once you setup your GCE account and enable billing, take a look [here](http://www.packer.io/docs/builders/googlecompute.html) and [here](https://github.com/mitchellh/packer/issues/809) for additional Packer specific information.

Testing
-------

[![Build Status](https://travis-ci.org/darron/consul-cookbook.png?branch=master)](https://travis-ci.org/darron/consul-cookbook)

The cookbook provides the following Rake tasks:

    rake build                        # Syntax check and build all Packer targets
    rake build_ami                    # Syntax check and build AMI
    rake build_droplet                # Syntax check and build Droplet
    rake build_gce                    # Syntax check and build Google Compute Image
    rake build_openstack              # Syntax check and build Openstack Image
    rake build_vagrant                # Syntax check and build Vagrant box
    rake cleanup_vendor               # Cleanup Vendor directory
    rake convert_gce                  # Convert GCE key to pem format
    rake food_extra                   # Run extra Foodcritic rulesets
    rake integration                  # Alias for kitchen:all
    rake kitchen:all                  # Run all test instances
    rake kitchen:default-ubuntu-1204  # Run default-ubuntu-1204 test instance
    rake kitchen:default-ubuntu-1304  # Run default-ubuntu-1304 test instance
    rake kitchen:default-ubuntu-1310  # Run default-ubuntu-1310 test instance
    rake lint                         # Lint Chef cookbooks
    rake rubocop                      # Run rubocop tests
    rake spec                         # Run ChefSpec examples
    rake tailor                       # Run tailor tests
    rake taste                        # Run taste tests
    rake test                         # Run all tests

License and Author
------------------

Author:: Darron Froese (darron@froese.org)

Copyright:: 2014, Darron Froese

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

Contributing
------------

We welcome contributed improvements and bug fixes via the usual workflow:

1. Fork this repository
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new pull request
