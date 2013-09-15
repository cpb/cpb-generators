# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cpb/generators/version'

Gem::Specification.new do |spec|
  spec.name          = "cpb-generators"
  spec.version       = Cpb::Generators::VERSION
  spec.authors       = ["Caleb Buxton"]
  spec.email         = ["me@cpb.ca"]
  spec.description   = %q{My idiomatic Ruby practices, encoded}
  spec.summary       = %q{Includes generators for common workflow patterns}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "thor", "~> 0.18"
  spec.add_dependency "rspec", "~> 2.13"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "cucumber", "~> 1.3"
  spec.add_development_dependency "rake", "~> 10.1"
  spec.add_development_dependency "pry", "= 0.9.12.2"
end
