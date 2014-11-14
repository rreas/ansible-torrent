require 'spec_helper'

describe service('rtorrent') do
  it { should be_running }
  it { should be_enabled }
end

describe port(54923) do
  it { should be_listening }
end

['data', 'watch'].each do |path|
  describe file("/torrents/#{path}") do
    it { should be_directory }

    it { should be_owned_by 'rtorrent' }
    it { should be_grouped_into 'rtorrent' }
  end
end
