# Spree Internationalization

[![Build Status](https://travis-ci.org/spree-contrib/spree_i18n.svg?branch=master)](https://travis-ci.org/spree-contrib/spree_i18n)
[![Code Climate](https://codeclimate.com/github/spree-contrib/spree_i18n/badges/gpa.svg)](https://codeclimate.com/github/spree-contrib/spree_i18n)

This is the Internationalization project for [Spree Commerce][1]

See the [official Internationalization documentation][2] for more details.

Happy translating!

---

1. Add this extension to your Gemfile with this line:

  #### Spree >= 3.1

  ```ruby
  gem 'spree_i18n', github: 'spree-contrib/spree_i18n'
  ```

  #### Spree 3.0 and Spree 2.x

  ```ruby
  gem 'spree_i18n', github: 'spree-contrib/spree_i18n', branch: 'X-X-stable'
  ```

  The `branch` option is important: it must match the version of Spree you're using.
  For example, use `3-0-stable` if you're using Spree `3-0-stable` or any `3.0.x` version.

2. Install the gem using Bundler:
  ```ruby
  bundle install
  ```

3. Copy & run migrations
  ```ruby
  bundle exec rails g spree_i18n:install
  ```

4. Restart your server

  If your server was running, restart it so that it can find the assets properly.

---

## Model Translations

We **removed** support for translating models into [a separate Gem](https://github.com/spree-contrib/spree_globalize).

Please update your `Gemfile` if you still need the model translations.

```ruby
# Gemfile
gem 'spree_globalize', github: 'spree-contrib/spree_globalize', branch: 'master'
```

---

## Upgrading

**WARNING**: If you want to keep your model translations, be sure to add the `spree_globalize` gem to your `Gemfile` **before** migrating the database. Otherwise **you will loose your translations**!

### 1. Migrate your database

    bin/rake spree_i18n:upgrade
    bin/rake db:migrate

*Note:* The migration automatically skips the removal of the translations tables. So it's safe to run the migration without data loss. But be sure to have the `spree_globalize` gem in your `Gemfile`, if you want to keep them.

### 2. Remove Assets

From `vendor/assets/javascripts/spree/backend/all.js`
```
//= require spree/backend/spree_i18n
```

and from `vendor/assets/stylesheets/spree/backend/all.css`
```
*= require spree/backend/spree_i18n
```

### 3. Remove Configuration

Remove all occurrences of `SpreeI18n::Config.supported_locales` from your code.

---

## Contributing

[See corresponding guidelines][7]

---

Copyright (c) 2010-2015 [Spree Commerce Inc.][1] and other [contributors][5]. released under the [New BSD License][6]

[1]: http://spreecommerce.com
[2]: http://guides.spreecommerce.com/developer/i18n.html
[5]: https://github.com/spree-contrib/spree_i18n/graphs/contributors
[6]: https://github.com/spree-contrib/spree_i18n/blob/master/LICENSE.md
[7]: https://github.com/spree-contrib/spree_i18n/blob/master/CONTRIBUTING.md
