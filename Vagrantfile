# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.cache.scope = :box if Vagrant.has_plugin?('vagrant-cachier')

  config.vm.box = 'ubuntu/trusty64'
  config.vm.network 'private_network', ip: '192.168.33.123'

  config.vm.provision 'ansible' do |ansible|
    ansible.inventory_path      = 'testing'
    ansible.playbook            = 'server.yml'
    ansible.vault_password_file = '.vaultkey'
    ansible.limit               = 'all'
    ansible.sudo                = true
  end

  config.vm.provider 'virtualbox' do |vb|
    vb.customize ['modifyvm', :id, '--cpus',   2]
    vb.customize ['modifyvm', :id, '--memory', 2048]
  end
end
