
task :default => :spec

desc "Ejecutar las espectativas de la clase myexam_2"
task :spec do
  sh "rspec -I. spec/p10_spec.rb"
end

desc "Ejecutar con documentacion"
task :doc do
  sh "rspec -I. spec/p10_spec.rb --format documentation"
end

desc "Ejecutar con documentacion"
task :html do
  sh "rspec -I. spec/p10_spec.rb --format html -o pruebas.html"
end

