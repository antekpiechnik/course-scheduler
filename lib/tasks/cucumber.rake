require 'cucumber/rake/task'

namespace :merb_cucumber do
  task :test_env do
    Merb.start_environment(:environment => "test", :adapter => 'runner')
  end
end

Cucumber::Rake::Task.new(:cucumber) do |t|
  t.cucumber_opts = "--format progress"
end

Cucumber::Rake::Task.new(:"cucumber:wip") do |t|
  t.cucumber_opts = "--tags @wip --wip --format progress"
end

dependencies = ['merb_cucumber:test_env', 'sequel:db:reset']
task :cucumber => dependencies
task :"cucumber:wip" => dependencies
