# Spree Internationalization

This is the Internationalization project for [Spree Commerce](http://spreecommerce.com/)

See the [official Internationalization documentation](http://guides.spreecommerce.com/i18n.html) for more details.

To install, simply add the Gem to your Gemfile:

1. Add the following to your Gemfile
<pre>
  gem 'spree_i18n', :git => 'git://github.com/spree/spree_i18n.git'
</pre>

2. Run `bundle install`

## Contribute

There are still many partial translated locales that we need help with, they might be partial now due to changes since version 1.3:

- de-CH (German - Switzerland)
- de (German)
- es-MX (Spainsh - Mexico)
- es (Spanish)
- et (Estonian)
- fa (Farsi)
- fi (Finnish)
- fr (French)
- id (Indonesian)
- ko (Korean)
- lt (Lithuanian)
- lv (Latvian)
- nb-NO (Norweigian, Bokmål)
- nl-BE (Dutch - Belgium)
- pl (Polish)
- pt-PT (Portuguese - Portugal)
- ro (Romanian)
- sk (Slovaki)
- sl-SI (Slovenian)
- sv-SE (Swedish)
- th (Thai)
- uk (Ukrainian)
- vi (Vietnamese)
- zh-CN (Chinese)
- zh-TW (Chinese - Taiwan (Traditional Chinese))

Missing locales:

If you contribute with a missing locale start by copy the structure from config/locales/en.yml

- ar (Arabic)
- nn (Norwegian - Nynorsk)
- ms (Malay)
- and more..

## Running the tests

If you would like to run the tests of this project, follow these steps:

1. Clone this repo using `git clone git://github.com/spree/spree_i18n`
2. Change into the directory and run `bundle exec rake test_app` to generate a dummy application.
3. Run `bundle exec rspec spec` to run the tests.
