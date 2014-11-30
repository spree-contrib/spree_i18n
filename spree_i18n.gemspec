Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_i18n'
  s.version     = '3.0.0'
  s.summary     = 'Provides locale information for use in Spree.'
  s.description = s.summary

  s.author      = 'Sean Schofield'
  s.email       = 'sean.schofield@gmail.com'
  s.homepage    = 'http://spreecommerce.com'

  s.files        = Dir['LICENSE', 'README.md', 'default/**/*', 'config/**/*', 'lib/**/*']
  s.require_path = 'lib'
  s.requirements << 'none'

  s.has_rdoc = false

  s.add_runtime_dependency 'friendly_id-globalize'
  s.add_runtime_dependency 'globalize', '~> 4.0.3'
  s.add_runtime_dependency 'i18n_data', '~> 0.5.1'
  s.add_runtime_dependency 'rails-i18n', '~> 4.0.1'
  s.add_runtime_dependency 'spree_core', '~> 2.2.0'

  s.add_development_dependency 'rspec-rails', '~> 2.13'
  s.add_development_dependency 'sqlite3', '~> 1.3.7'
  s.add_development_dependency 'pry'
end
