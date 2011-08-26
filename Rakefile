require 'rake/clean'
require 'rubygems'

task :default => :package

$spec = eval(File.read('scp_homey.gemspec'))

def package(ext='')
  "pkg/scp_homey-#{$spec.version}" + ext
end

desc 'Build packages'
task :package => %w[.gem].map {|e| package(e)}

desc 'Build and install as local gem'
task :install => package('.gem') do
  sh "sudo gem install #{package('.gem')}"
end

directory 'builds/'

file package('.gem') => %w[pkg/ scp_homey.gemspec] + $spec.files do |f|
  sh "gem build scp_homey.gemspec"
  mv File.basename(f.name), f.name
end
