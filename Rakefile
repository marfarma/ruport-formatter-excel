require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "ruport-formatter-excel"
    gem.summary = %Q{Ruport formatting to excel via 'spreadsheet' gem}
    gem.description = gem.summary # blah
    gem.email = "erik@hollensbe.org"
    gem.homepage = "http://github.com/erikh/ruport-formatter-excel"
    gem.authors = ["Erik Hollensbe"]
    gem.add_development_dependency "rspec", ">= 1.2.9"
    gem.add_development_dependency "rdoc"
    gem.add_dependency 'ruport'
    gem.add_dependency 'spreadsheet'
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :spec => :check_dependencies

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "ruport-formatter-excel #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
