require "rake/testtask"

task default: :test

Rake::TestTask.new do |t|
  t.pattern = "test/*_test.rb"
end

require "sinatra/activerecord/rake"

namespace :db do
  task :load_config do
    require_relative "./app"
  end
end
