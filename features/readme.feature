Feature: I can install cpb-generators and generate files

  @disable-bundler
  Scenario: Installation in the development group
    Given a file named "Gemfile" with:
    """
    group :development do
      gem 'cpb-generators', path: '../..'
    end
    """
    And I run `bundle install`
    When I run `bundle exec cpb entity namespace/new_name`
    Then a file named "lib/namespace/new_name.rb" should exist
    And a file named "spec/namespace/new_name_spec.rb" should exist

  Scenario: Usage post installation
    Given a Gemfile setup with:
    """
    group :development do
      gem 'cpb-generators', path: '../..'
    end
    """
    And I run `bundle exec cpb entity namespace/class_name`
    When I run `bundle exec rspec`
    Then the output should contain "pending"
