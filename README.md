# Itamae::Plugin::Recipe::RtnPhpNabe

[Itamae](https://github.com/itamae-kitchen/itamae) recipe plugin for [php-nabe](https://github.com/kawahara/php-nabe).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'itamae-plugin-recipe-rtn_php_nabe'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install itamae-plugin-recipe-rtn_php_nabe

## Usage

### install for system

```ruby
include_recipe 'rtn_php_nabe::system'
```

### node.json

```json
{
  "rtn_php_nabe": {
    "versions": {
      "5.6.4": {
        "configure": "--with-curl --enable-sockets",
        "extensions": ["mbstring"]
      },
      "5.5.20": {
        "configure": "",
        "extensions": []
      }
    },
    "use": "5.6.4"
  }
}
```

## Contributing

1. Fork it ( https://github.com/rutan/itamae-plugin-recipe-rtn_php_nabe/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
