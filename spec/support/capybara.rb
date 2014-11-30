require 'capybara/rspec'
require 'capybara/rails'
require 'capybara/poltergeist'

RSpec.configure do |config|
  Capybara.javascript_driver = :poltergeist

  Capybara.register_driver(:poltergeist) do |app|
    Capybara::Poltergeist::Driver.new app, timeout: 30
  end
end
