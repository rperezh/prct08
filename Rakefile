task :default => :test

desc 'Run lib/Preguntas.rb'
task :bin do
  sh 'ruby -I. lib/Preguntas.rb'
end
  
desc 'Run test with --format documentation'
task :test do
  sh 'rspec spec/Preguntas_spec.rb --format documentation'
end

desc 'Run test with format: html'
task :thtml do
  sh 'rspec spec/Preguntas_spec.rb --format html'
end
