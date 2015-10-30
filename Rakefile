require 'rubygems'
require 'rake'
require 'rake/testtask'
require 'rake/packagetask'
require 'rubygems/package_task'
require 'rspec/core/rake_task'
require 'spree/testing_support/common_rake'
require 'spree_i18n'

Bundler::GemHelper.install_tasks
RSpec::Core::RakeTask.new

task default: :spec

spec = eval(File.read('spree_i18n.gemspec'))

Gem::PackageTask.new(spec) do |p|
  p.gem_spec = spec
end

desc 'Generates a dummy app for testing'
task :test_app do
  ENV['LIB_NAME'] = 'spree_i18n'
  Rake::Task['common:test_app'].invoke
end

namespace :spree_i18n do
  desc 'Update by retrieving the latest Spree locale files for i18n-tasks'
  task :update_en do
    puts "Fetching latest English Spree locale"
    require 'open-uri'
    location = 'https://raw.github.com/spree/spree/master/core/config/locales/en.yml'

    open("config/locales/en.yml", 'wb') do |file|
      file << open(location).read
    end
  end
end
