require "bundler/gem_tasks"

task :default => :spec

desc 'Run RSpec code examples'
task :spec do
  sh 'rspec spec/exam_spec.rb'
end

desc 'Run lib/exam.rb'
task :bin do
  sh 'ruby -I. lib/exam.rb'
end
    
desc 'Run test with --format documentation'
task :test do
  sh 'rspec spec/exam_spec.rb --format documentation'
end

desc 'Run test with format: html'
task :thtml do
  sh 'rspec spec/exam_spec.rb --format html'
end
