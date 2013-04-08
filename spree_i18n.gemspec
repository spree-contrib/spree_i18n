Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_i18n'
  s.version     = '1.0.0'
  s.summary     = 'Provides internationalization support for Spree Commerce.'
  s.description = 'Provides internationalization support for Spree Commerce.'
  s.required_ruby_version = '>= 1.9.3'

  s.author      = 'Sean Schofield'
  s.email       = 'sean@railsdog.com'
  s.homepage    = 'http://spreecommerce.com'

  s.rubyforge_project = 'spree_i18n'

  s.files        = Dir['LICENSE', 'README.md', 'default/**/*', 'config/**/*', 'lib/**/*']
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency('i18n', ['~> 0.6.1'])
  s.add_dependency('rails-i18n', ['~> 0.7.3'])
  s.add_dependency('spree_core', ['~> 2.0.0.beta'])

  s.add_development_dependency('rspec-rails', ['~> 2.13'])
  s.add_development_dependency('sqlite3', ['~> 1.3.7'])
  s.add_development_dependency('i18n-spec', ['~> 0.4.0'])
  s.add_development_dependency('fuubar', ['>= 0.0.1'])
end
