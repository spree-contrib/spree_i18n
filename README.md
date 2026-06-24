# Spree Internationalization

[![CI](https://github.com/spree/spree_i18n/actions/workflows/ci.yml/badge.svg)](https://github.com/spree/spree_i18n/actions/workflows/ci.yml)

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
  bundle add spree_i18n
  ```

2. Run the install generator

  ```ruby
  bundle exec rails g spree_i18n:install
  ```

3. Restart your server

  If your server was running, restart it so that it can find the assets properly.

## Developing

1. Create a dummy app

    ```bash
    bundle update
    bundle exec rake test_app
    ```

2. Add your new code
3. Run tests

    ```bash
    bundle exec rspec
    ```

## Releasing a new version

```shell
bundle exec gem bump -p -t
bundle exec gem release
```

For more options please see [gem-release README](https://github.com/svenfuchs/gem-release)

## Contributing

If you'd like to contribute, please take a look at the
[instructions](CONTRIBUTING.md) for installing dependencies and crafting a good
pull request.

---

Copyright (c) 2010-2026 [Spree Commerce Inc.][1] and other [contributors][5], released under the [New BSD License][6]

[1]: https://spreecommerce.org
[2]: https://spreecommerce.org/docs/developer/core-concepts/i18n#internationalization
[5]: https://github.com/spree/spree_i18n/graphs/contributors
[6]: https://github.com/spree/spree_i18n/blob/main/LICENSE.md
[7]: https://github.com/spree/spree_i18n/blob/main/CONTRIBUTING.md
