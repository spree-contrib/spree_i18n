#Spree Internationalization

This is the Internationalization project for [Spree Commerce](http://spreecommerce.com/)

See the [official Internationalization documentation](http://guides.spreecommerce.com/i18n.html) for more details.

To install, simply add the Gem to your Gemfile:

1. Add the following to your Gemfile
<pre>
  gem 'spree_i18n', :git => 'git://github.com/spree/spree_i18n.git'
</pre>

2. Run `bundle install`

## Model Translations

We've added support for translating models. The feature uses the [globalize3](https://github.com/svenfuchs/globalize3)
gem to localize model data. So far the following models are translatable:

  Product, Promotion, OptionType, Taxonomy, Taxon and Property.

Try it out! Point to the translate-models branch:

    gem 'spree_i18n', :git => 'git://github.com/spree/spree_i18n.git', :branch => 'translate-models'

You can use the generator to install migrations and append spree_i18n assets to
your app spree manifest file.

    rails g spree_i18n:install

This will insert this lines on your spree manifest files:

    app/assets/javascripts/admin/all.js
    //= require admin/spree_i18n

    app/assets/javascripts/store/all.js
    //= require store/spree_i18n

    app/assets/stylesheets/admin/all.css
    *= require admin/spree_i18n

Start you server and you should see a TRANSLATIONS link or a flag icon on each
admin section that supports this feature.

The extension contains two configs that allow users to customize which locales
should be displayed as options on the translation forms and which should be
listed to customers on the frontend. You can set them on an initializer. e.g.

    # displayed on translation forms
    SpreeI18n::Config.available_locales = [:en, :es, :'pt-BR']
    # displayed on frontend select box
    SpreeI18n::Config.supported_locales = [:en, :'pt-BR']

ps. please use symbols, not strings. e.g. :'pt-BR' not just 'pt-BR'. Otherwise
you may get unexpected errors

Or if you prefer they're also available on the admin UI general settings section.

## Running the tests 

If you would like to run the tests of this project, follow these steps:

1. Clone this repo using `git clone git://github.com/spree/spree_i18n`
2. Change into the directory and run `bundle exec rake test_app` to generate a dummy application.
3. Run `bundle exec rspec spec` to run the tests.
