require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

require 'cucumber/rake/task'
Cucumber::Rake::Task.new(:features)

Cucumber::Rake::Task.new(:run_aruba_features, nil) do |t|
  t.cucumber_opts = "ARUBA_REPORT_DIR=doc --format progress"
end

task :check_for_pygments do
  unless system("pygmentize", [:err,:out]=>"/dev/null")
    raise "You're missing pygmentize, try:\n sudo easy_install Pygments"
  end
end

desc "Run Cucumber features generating Aruba Report using Pygments"
task :aruba_features => [:check_for_pygments, :run_aruba_features]
task :default => [:spec,:features]
