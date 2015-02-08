require 'rack/test'
require 'rspec'

#set :environment, :test
ENV['RACK_ENV'] == 'test'

module RSpecMixin
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end
end

RSpec.configure do |conf|
  conf.include RSpecMixin
end
