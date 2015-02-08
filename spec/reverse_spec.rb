require_relative 'spec_helper.rb'
require File.dirname(__FILE__) + '/../reverse.rb'

describe "Reverse Service" do
  it "should reverse the string you provide it" do
    expect(reverse("George")).to eq("egroeG")
  end
end

describe "Testing Home" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it "should load the home page" do
    get '/'
    expect(last_response).to be_ok
  end
end

