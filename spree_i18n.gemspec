# encoding: UTF-8
lib = File.expand_path('../lib/', __FILE__)
$LOAD_PATH.unshift lib unless $LOAD_PATH.include?(lib)

require 'spree_i18n/version'

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_i18n'
  s.version     = SpreeI18n::VERSION
  s.summary     = 'Provides locale information and translations for Spree Commerce.'
  s.description = 'Adds locale files, country/language names and translation tooling for internationalizing Spree Commerce stores.'
  s.required_ruby_version = '>= 3.2'

  s.author    = 'Vendo Connect Inc.'
  s.email     = 'hello@spreecommerce.org'
  s.homepage  = 'https://github.com/spree/spree_i18n'
  s.license   = 'BSD-3-Clause'

  s.metadata = {
    'bug_tracker_uri' => 'https://github.com/spree/spree_i18n/issues',
    'changelog_uri' => "https://github.com/spree/spree_i18n/releases/tag/v#{s.version}",
    'documentation_uri' => 'https://docs.spreecommerce.org/',
    'source_code_uri' => "https://github.com/spree/spree_i18n/tree/v#{s.version}"
  }

  s.files        = Dir["{app,config,db,lib,vendor}/**/*", "LICENSE.md", "Rakefile", "README.md"].reject { |f| f.match(/^spec/) && !f.match(/^spec\/fixtures/) }
  s.require_path = 'lib'
  s.requirements << 'none'

  spree_version = '>= 5.4.0.alpha'
  s.add_dependency 'spree_core', spree_version
  s.add_dependency 'spree_extension'

  s.add_dependency 'i18n_data'
  s.add_dependency 'rails-i18n'
  s.add_dependency 'kaminari-i18n'

  s.add_development_dependency 'spree_dev_tools'
  s.add_development_dependency 'i18n-tasks'
end
