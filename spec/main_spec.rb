require_relative './spec_helper.rb'
require File.dirname(__FILE__) + '/../main.rb'

describe "Testing Main Home" do
  it "should load main home page" do
    get '/'
    expect(last_response).to be_ok
  end
end
