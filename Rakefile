require 'rake/clean'
require 'rubygems'

task :default => :package

$spec = eval(File.read('alvalaxia.gemspec'))

def package(ext='')
  "pkg/alvalaxia-#{$spec.version}" + ext
end

desc 'Build packages'
task :package => %w[.gem].map {|e| package(e)}

desc 'Build and install as local gem'
task :install => package('.gem') do
  sh "sudo gem install #{package('.gem')}"
end

directory 'builds/'

file package('.gem') => %w[pkg/ alvalaxia.gemspec] + $spec.files do |f|
  sh "gem build alvalaxia.gemspec"
  mv File.basename(f.name), f.name
end
