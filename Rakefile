require 'bundler/gem_tasks'
require 'rake/testtask'

Rake::TestTask.new do |task|
  task.libs << 'lib'
  task.libs << 'test'
  task.pattern = 'test/**/*_test.rb'
  task.warning = true
  task.verbose = true
end

task default: :test
