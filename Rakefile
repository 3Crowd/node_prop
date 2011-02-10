require 'rspec/core/rake_task'
require 'metric_fu'

MetricFu::Configuration.run do |config|
  config.metrics = [:churn, :flay, :flog, :reek, :roodi, :hotspots]
  config.graphs = [:flog, :flay, :stats]
end

RSpec::Core::RakeTask.new :spec

desc 'Run RSpec in Documentation printing mode, verbosely enumerate all specifications'
RSpec::Core::RakeTask.new :specdoc do |s|
  s.rspec_opts	= ['--format documentation',
                   '--color'
                  ]
end

require 'bundler'

Bundler::GemHelper.install_tasks

require 'yard'

namespace :doc do

  YARD::Rake::YardocTask.new(:public) do |t|
    t.files   = ['lib/**/*.rb']
    t.options = ['-odoc']
  end

  YARD::Rake::YardocTask.new(:private) do |t|
    t.files  = ['lib/**/*.rb']
    t.options= ['--private',
                '-oprivate_api_doc'
               ]
  end

end

namespace :cover_me do

  task :report do
    require 'cover_me'
    CoverMe.complete!
  end

end

task :spec do
  Rake::Task['cover_me:report'].invoke
end

task :specdoc do
  Rake::Task['cover_me:report'].invoke
end

task :default => [ :spec, 'doc:public', 'doc:private', 'metrics:all' ]
