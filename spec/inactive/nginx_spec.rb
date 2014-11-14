require 'spec_helper'

describe service('nginx') do
  it { should be_running }
  it { should be_enabled }
end

describe port(443) do
  it { should be_listening }
end

describe port(80) do
  it { should_not be_listening }
end

describe command('curl -k https://localhost/transmission') do
  its(:stdout) { should match /401.*Unauthorized/ }
end
