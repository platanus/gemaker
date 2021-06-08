# Gemaker

[![Gem Version](https://badge.fury.io/rb/gemaker.svg)](https://badge.fury.io/rb/gemaker)
[![CircleCI](https://circleci.com/gh/platanus/gemaker.svg?style=shield)](https://app.circleci.com/pipelines/github/platanus/gemaker)
[![Coverage Status](https://coveralls.io/repos/github/platanus/gemaker/badge.svg)](https://coveralls.io/github/platanus/gemaker)

Ruby CLI created to build Platanus' gems.

## Installation

```bash
$ gem install gemaker
```

## Usage

To build a new gem with all the configuration we use in Platanus, run the following command...

```bash
gemaker new my_gem
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Publishing

On master/main branch...

1. Change `VERSION` in `lib/gemaker/version.rb`.
2. Change `Unreleased` title to current version in `CHANGELOG.md`.
3. Commit new release. For example: `Releasing v0.1.0`.
4. Create tag. For example: `git tag v0.1.0`.
5. Push tag. For example: `git push origin v0.1.0`.

## Credits

Thank you [contributors](https://github.com/platanus/gemaker/graphs/contributors)!

<img src="http://platan.us/gravatar_with_text.png" alt="Platanus" width="250"/>

My Gem is maintained by [platanus](http://platan.us).

## License

Gemaker is © 2016 platanus, spa. It is free software and may be redistributed under the terms specified in the LICENSE file.
