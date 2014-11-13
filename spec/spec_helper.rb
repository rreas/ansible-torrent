require 'serverspec'
require 'specinfra/helper/set'

include Specinfra::Helper::Set

options = {
  user:         'vagrant',
  auth_methods: ['publickey'],
  keys:         ['~/.vagrant.d/insecure_private_key']
}

set :backend,     :ssh
set :host,        ENV['TARGET_HOST']
set :ssh_options, options
