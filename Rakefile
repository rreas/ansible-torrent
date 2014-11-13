require 'rake'
require 'rspec/core/rake_task'

task spec:    'spec:all'
task default: 'spec'

namespace :spec do
  addrs = Dir
    .glob('./spec/*')
    .select { |path| File.directory?(path) }
    .map    { |path| File.basename(path) }

  task all:     addrs
  task default: 'all'

  addrs.each do |addr|
    desc "Run serverspec tests to #{addr}"
    RSpec::Core::RakeTask.new(addr.to_sym) do |t|
      ENV['TARGET_HOST'] = addr
      t.pattern = "spec/#{addr}/*_spec.rb"
    end
  end
end
