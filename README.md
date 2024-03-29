# Spree Internationalization

[![Build Status](https://travis-ci.org/spree-contrib/spree_i18n.svg?branch=master)](https://travis-ci.org/spree-contrib/spree_i18n)
[![Code Climate](https://codeclimate.com/github/spree-contrib/spree_i18n/badges/gpa.svg)](https://codeclimate.com/github/spree-contrib/spree_i18n)

This is the Internationalization project for [Spree Commerce][1] See the [official Internationalization documentation][2] for more details.

Happy translating!

## Maintained by

[![Vendo](https://assets-global.website-files.com/6230c485f2c32ea1b0daa438/623372f40a8c54ca9aea34e8_vendo%202.svg)](https://getvendo.com?utm_source=spree_i18n_github)

> All-in-one platform for all your Marketplace and B2B eCommerce needs. [Start your 30-day free trial](https://e98esoirr8c.typeform.com/contactvendo?typeform-source=spree_i18n_github)

## Installation

1. Add this extension to your Gemfile with this line:

  ```ruby
  gem 'spree_i18n'
  ```

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

## Upgrading to 5.0 (only Spree 4.2+)

### 1. Remove Asset references

From `vendor/assets/javascripts/spree/backend/all.js`
```
//= require spree/backend/spree_i18n
```

and from `vendor/assets/javascripts/spree/frontend/all.js`
```
//= require spree/frontend/spree_i18n
```

and from `vendor/assets/stylesheets/spree/backend/all.css`
```
*= require spree/backend/spree_i18n
```

and from `vendor/assets/stylesheets/spree/frontend/all.css`
```
*= require spree/backend/spree_i18n
```

---

## Contributing

[See corresponding guidelines][7]

---

Copyright (c) 2010-2015 [Spree Commerce Inc.][1] and other [contributors][5]. released under the [New BSD License][6]

[1]: https://spreecommerce.org
[2]: https://dev-docs.spreecommerce.org/customization/i18n
[5]: https://github.com/spree-contrib/spree_i18n/graphs/contributors
[6]: https://github.com/spree-contrib/spree_i18n/blob/master/LICENSE.md
[7]: https://github.com/spree-contrib/spree_i18n/blob/master/CONTRIBUTING.md
