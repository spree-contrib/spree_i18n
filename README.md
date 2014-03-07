# Spree Internationalization

This is the Internationalization project for [Spree Commerce][1]

See the [official Internationalization documentation][2] for more details.

Happy translating!

## Installation

Add the following to your `Gemfile`. 

```ruby
gem 'spree_i18n', github: 'spree/spree_i18n'
```

Run `bundle install`

You can use the generator to install migrations and append spree_i18n assets to
your app spree manifest file.

    rails g spree_i18n:install

This will insert these lines into your spree manifest files:

    vendor/assets/javascripts/spree/backend/all.js
    //= spree/backend/spree_i18n

    vvendor/assets/javascripts/spree/frontend/all.js
    //= spree/frontend/spree_i18n

    vendor/assets/stylesheets/spree/frontend/all.css
    *= require spree/frontend/spree_i18n

## Model Translations

We've added support for translating models. The feature uses the [globalize3][3]
gem to localize model data. So far the following models are translatable:

  Product, Promotion, OptionType, Taxonomy, Taxon and Property.

Start you server and you should see a TRANSLATIONS link or a flag icon on each
admin section that supports this feature.

The extension contains two configs that allow users to customize which locales
should be displayed as options on the translation forms and which should be
listed to customers on the frontend. You can set them on an initializer. e.g.

```ruby
SpreeI18n::Config.available_locales = [:en, :es, :'pt-BR'] # displayed on translation forms
SpreeI18n::Config.supported_locales = [:en, :'pt-BR'] # displayed on frontend select box
```

ps. please use symbols, not strings. e.g. :'pt-BR' not just 'pt-BR'. Otherwise
you may get unexpected errors

Or if you prefer they're also available on the admin UI general settings section.

*Every record needs to have a translation. If by any chance you remove spree_i18n
from your Gemfile, add some records and then add spree_i18n gem back you might get
errors like ``undefined method for nilClass`` because Globalize will try fetch
translations that do not exist.*

## Running the tests

If you would like to run the tests of this project, follow these steps:

1. Clone this repo using `git clone git://github.com/spree/spree_i18n`
2. Change into the directory and run `bundle exec rake test_app` to generate a dummy application.
3. Run `bundle exec rspec spec` to run the tests.

Copyright (c) 2013 Spree Commerce Inc. and other contributors. released under the [New BSD License][6]

[1]: http://spreecommerce.com
[2]: http://guides.spreecommerce.com/i18n.html
[3]: https://github.com/svenfuchs/globalize3
[6]: https://github.com/spree/spree_i18n/tree/master/LICENSE
[7]: https://github.com/globalize/globalize
[8]: https://github.com/airblade/paper_trail
