task :default => :test

desc 'Run lib/Preguntas.rb'
task :bin do
  sh 'ruby -Ilib -Ispec lib/Preguntas.rb'
end
  
desc 'Run test with --format documentation'
task :test do
  sh 'ruby -Ilib -Ispec spec/Preguntas_spec.rb'
end

desc 'Run test with format: html'
task :thtml do
end