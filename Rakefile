require "bundler/gem_tasks"

task :default => :spec

desc 'Run RSpec code examples'
task :spec do
  sh 'rspec spec/exam_spec.rb'
end

desc 'Run Ruby files from lib folder'
task :bin do
#sh 'ruby -I. lib/exam.rb'
  sh 'ruby -I. lib/List.rb'
end
    
desc 'Run test with --format documentation'
task :test do
  sh 'rspec spec/exam_spec.rb --format documentation'
end

desc 'Run test with format: html'
task :thtml do
  sh 'rspec spec/exam_spec.rb --format html'
end

desc 'Run exam list'
task :list do
  sh 'rspec spec/list_exam_spec.rb'
end


