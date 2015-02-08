require 'rake'
require 'rspec/core/rake_task'
require "sinatra/activerecord/rake"

namespace :db do
  task :load_config do
    require "./main"
  end
end

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = Dir.glob('spec/**/*_spec.rb')
  t.rspec_opts = '--format progress'
  # t.rspec_opts << ' more options'
  #t.rcov = true
end
task :default => :spec
