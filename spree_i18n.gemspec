# encoding: UTF-8
lib = File.expand_path('../lib/', __FILE__)
$LOAD_PATH.unshift lib unless $LOAD_PATH.include?(lib)

require 'spree_i18n/version'

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_i18n'
  s.version     = SpreeI18n::VERSION
  s.summary     = 'Retired: Spree 6.0 ships its translations in spree_core.'
  s.description = 'This gem is retired. Spree 6.0 ships its translations in spree_core, so remove spree_i18n from your Gemfile.'
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

  s.files        = Dir['lib/**/*', 'LICENSE.md', 'README.md']
  s.require_path = 'lib'

  s.post_install_message = 'spree_i18n is no longer needed: Spree 6.0 ships its translations in spree_core. Remove it from your Gemfile.'

  s.add_dependency 'spree_core', '>= 6.0.0.beta', '< 7'
end
