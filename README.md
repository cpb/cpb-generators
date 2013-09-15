# Cpb::Generators

My idiomatic Ruby practices, encoded.
Includes generators for common workflow patterns.

## Installation

Add this line to your application's Gemfile:

    group :development do
      gem 'cpb-generators'
    end

And then execute:

    $ bundle

## Usage

    $ bundle exec cpb entity namespace/class_name
        create  lib/namespace/class_name.rb
        create  spec/namespace/class_name_spec.rb

    $ bundle exec rspec spec/namespace/class_name_spec.rb
    *

    Pending:
      Namespace::ClassName Define what Namespace::ClassName does
        # No reason given
        # ./spec/namespace/class_name_spec.rb:6

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
