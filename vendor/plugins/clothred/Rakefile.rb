# Rakefile.rb
# 9. April 2007
#

require 'rubygems'
require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require 'rake/gempackagetask'

begin
  gem 'ci_reporter'
rescue LoadError => e
  puts "#{e}: Continuing without XML output"
end

unless e
  require 'ci/reporter/rake/test_unit'
end


#List of tasks available

task :gem => ["pkg", "test"]

if e
  task :test
else
  task :test => ["ci:setup:testunit"]
end


Gem::manage_gems

spec = Gem::Specification.new do |s|
  s.name = "ClothRed"
  s.version = "0.4.1"
  s.author = 'Phillip "CynicalRyan" Gawlowski'
  s.email = "cmdjackryan@gmail.com"
  s.platform = Gem::Platform::RUBY
  s.summary = "RedCloth in reverse: Converting HTML into Textile markup"
  s.files = FileList["{lib,test}/**/*"].exclude("nbproject",".svn").to_a
  s.autorequire = "clothred"
  s.has_rdoc = true
  s.rubyforge_project ="clothred"
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.need_tar = true
end

Rake::TestTask.new do |test|
  test.name = "test"
  test.warning = true
  test.verbose = false
  test.test_files = FileList['test/test*.rb']
end

Rake::RDocTask.new do |rd|
  rd.title = "ClothRead documentation"
  rd.rdoc_files.exclude("Rakefile.rb")
  rd.rdoc_files.include("LICENSE.rdoc", "lib/clothred.rb", "README.rdoc")
  rd.rdoc_dir = "doc/html"
  rd.main = "README.rdoc"
end