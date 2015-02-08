require 'rack/test'

#set :environment, :test
ENV['RACK_ENV'] == 'test'

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
end
