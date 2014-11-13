require 'spec_helper'

describe service('ssh') do
  it { should be_running }
  it { should be_enabled }
end

describe port(22) do
  it { should be_listening }
end

describe file('/etc/ssh/sshd_config') do
  its(:content) { should     match /^PermitRootLogin[\s]+without-password/ }
  its(:content) { should     match /^PasswordAuthentication[\s]+no/ }
  its(:content) { should_not match /PermitRootLogin[\s]+yes/ }
  its(:content) { should_not match /PasswordAuthentication[\s]+yes/ }
end
