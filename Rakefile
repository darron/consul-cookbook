# encoding: utf-8
require 'foodcritic'
require 'rspec/core/rake_task'

desc 'Run Foodcritic lint checks'
FoodCritic::Rake::LintTask.new(:lint) do |t|
  t.options = { fail_tags: ['any'] }
end

desc 'Run extra Foodcritic rulesets'
task :food_extra do
  sh 'if [ "$(ls -A foodcritic/)" ]; then bundle exec foodcritic -f any -I foodcritic/* .; fi'
end

desc 'Run ChefSpec examples'
RSpec::Core::RakeTask.new(:spec)

desc 'Run all tests'
task test: [:cleanup_vendor, :lint, :food_extra, :spec, :rubocop]
task default: :test

desc 'Run rubocop tests'
task :rubocop do
  sh 'bundle exec rubocop'
end

desc 'Cleanup Vendor directory'
task :cleanup_vendor do
  sh 'rm -rf vendor/cookbooks/*'
end

task :berksintall do
  sh 'berks install --path vendor/cookbooks'
end

desc 'Syntax check and build Vagrant box'
task build_vagrant: [:cleanup_vendor, :cleanup_vagrant, :lint, :spec, :rubocop, :berksintall, :vagrantup]
task vagrant: :build_vagrant

task :vagrantup do
  sh 'vagrant up --provision'
end

task :cleanup_vagrant do
  sh 'vagrant destroy -f'
end

desc 'Syntax check and build all Packer targets'
task build: [:cleanup_vendor, :lint, :spec, :rubocop, :packer]

task packer: [:cleanup_vendor, :packer_build]

task :packer_build do
  sh 'berks install --path vendor/cookbooks; packer build template.json'
end

desc 'Syntax check and build AMI'
task build_ami: [:cleanup_vendor, :lint, :spec, :rubocop, :packer_ami]

task packer_ami: [:cleanup_vendor, :packer_build_ami]

task :packer_build_ami do
  sh 'berks install --path vendor/cookbooks; packer build -only=amazon-ebs template.json'
end

desc 'Syntax check and build Droplet'
task build_droplet: [:cleanup_vendor, :lint, :spec, :rubocop, :packer_droplet]

task packer_droplet: [:cleanup_vendor, :packer_build_droplet]

task :packer_build_droplet do
  sh 'berks install --path vendor/cookbooks; packer build -only=digitalocean template.json'
end

desc 'Syntax check and build Openstack Image'
task build_openstack: [:cleanup_vendor, :lint, :spec, :rubocop, :packer_openstack]

task packer_openstack: [:cleanup_vendor, :packer_build_openstack]

task :packer_build_openstack do
  sh 'berks install --path vendor/cookbooks; packer build -only=openstack template.json'
end

desc 'Syntax check and build Google Compute Image'
task build_gce: [:cleanup_vendor, :lint, :spec, :rubocop, :packer_gce]

task packer_gce: [:cleanup_vendor, :packer_build_gce]

task :packer_build_gce do
  sh 'berks install --path vendor/cookbooks; packer build -only=googlecompute template.json'
end

desc 'Convert GCE key to pem format.'
task :convert_gce do
  sh 'openssl pkcs12 -in google.p12 -nocerts -passin pass:notasecret -nodes -out google.pem'
end

desc 'Enable Docker build.'
task :docker_enable do
  sh 'mv .kitchen.yml .kitchen-vagrant.yml; mv .kitchen-docker.yml .kitchen.yml'
end

desc 'Disable Docker build.'
task :docker_disable do
  sh 'mv .kitchen.yml .kitchen-docker.yml; mv .kitchen-vagrant.yml .kitchen.yml'
end

desc 'Usage: rake knife_solo user={user} ip={ip.address.goes.here}'
task :knife_solo do
  sh 'rm -rf cookbooks && rm -rf nodes'
  sh 'mkdir cookbooks && berks install --path cookbooks'
  sh "mkdir nodes && echo '{\"run_list\":[\"consul::default\"]}' > nodes/#{ENV['ip']}.json"
  sh "bundle exec knife solo bootstrap #{ENV['user']}@#{ENV['ip']}"
end

begin
  require 'kitchen/rake_tasks'
  Kitchen::RakeTasks.new

  desc 'Alias for kitchen:all'
  task integration: 'kitchen:all'
rescue LoadError
  puts '>>>>> Kitchen gem not loaded, omitting tasks' unless ENV['CI']
end
