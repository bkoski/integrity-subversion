require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "integrity-subversion"
    s.summary = %Q{Bundled subversion support for integrity}
    s.email = "gems@benkoski.com"
    s.homepage = "http://github.com/bkoski/integrity-subversion"
    s.description = "Bundled subversion support for integrity"
    s.authors = ["Ben Koski"]
    s.files = FileList["{lib,lib/integrity,lib/integrity/scm,lib/integrity/scm/subversion}**/*", "README.rdoc", "LICENSE"]
        
    s.add_dependency 'integrity'
    s.add_dependency 'thor'
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = 'integrity-subversion'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib' << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |t|
    t.libs << 'test'
    t.test_files = FileList['test/**/*_test.rb']
    t.verbose = true
  end
rescue LoadError
  puts "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
end

task :default => :test
