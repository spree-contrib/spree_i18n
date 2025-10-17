# Spree Internationalization

[![Build Status](https://travis-ci.org/spree-contrib/spree_i18n.svg?branch=master)](https://travis-ci.org/spree-contrib/spree_i18n)
[![Code Climate](https://codeclimate.com/github/spree-contrib/spree_i18n/badges/gpa.svg)](https://codeclimate.com/github/spree-contrib/spree_i18n)

This is the Internationalization project for [Spree Commerce][1] 

See the [official Internationalization documentation][2] for more details.

Happy translating!

## Maintained by

Spree is developed and maintained by

<a href="https://getvendo.com">
<img alt="Vendo" src="https://avatars.githubusercontent.com/u/89416582?s=96&v=4" />
</a>

> Vendo is the commercial entity behind Spree Commerce and in particular the latest, unprecedented investment into Spree 5 and following versions as well as its integrations. We've been the Spree core team since 2016 and led numerous Spree projects while supporting the community. Learn more at: https://www.getvendo.com/

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
[2]: https://spreecommerce.org/docs/developer/core-concepts/i18n#internationalization
[5]: https://github.com/spree-contrib/spree_i18n/graphs/contributors
[6]: https://github.com/spree-contrib/spree_i18n/blob/master/LICENSE.md
[7]: https://github.com/spree-contrib/spree_i18n/blob/master/CONTRIBUTING.md
