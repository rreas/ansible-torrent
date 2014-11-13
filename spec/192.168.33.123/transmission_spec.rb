require 'spec_helper'

describe service('transmission-daemon') do
  it { should be_running }
  it { should be_enabled }
end

describe port(54923) do
  it { should be_listening }
end

['data', 'watch'].each do |path|
  describe file("/torrents/#{path}") do
    it { should be_directory }

    it { should be_owned_by 'debian-transmission' }
    it { should be_grouped_into 'debian-transmission' }
  end
end
