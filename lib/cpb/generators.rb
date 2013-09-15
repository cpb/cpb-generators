require "cpb/generators/version"
require "thor"

require 'cpb/generators/class_generator'

module Cpb
  module Generators
    class Runner < Thor
      register Cpb::Generators::ClassGenerator, "entity", "entity [class_name]", "Generates a class and spec"
    end
  end
end
