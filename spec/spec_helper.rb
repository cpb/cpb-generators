$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'cpb/generators'

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}
Dir["#{File.dirname(__FILE__)}/matchers/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  config.extend(Helpers::ClassMethods)
  config.include(Helpers::InstanceMethods)
end
