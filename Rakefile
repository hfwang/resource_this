# encoding: utf-8

require "rubygems"
require "rake"
require "rake/testtask"

desc "Default: run unit tests."
task :default => :test

desc "Test the resource_this plugin."
Rake::TestTask.new(:test) do |t|
  t.libs << "lib"
  t.pattern = "test/**/*_test.rb"
  t.verbose = true
end

begin
  gem 'rubygems-tasks', '~> 0.2'
  require 'rubygems/tasks'

  Gem::Tasks.new
rescue LoadError => e
  warn e.message
  warn "Run `gem install rubygems-tasks` to install Gem::Tasks."
end
