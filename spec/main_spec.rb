require_relative './spec_helper.rb'
require File.dirname(__FILE__) + '/../main.rb'

describe "Testing Main Home" do
  it "should load main home page" do
    get '/'
    expect(last_response).to be_ok
  end

  it "should load about page" do
    get '/about'
    expect(last_response).to be_ok
  end

  it "should load contact page" do
    get '/contact'
    expect(last_response).to be_ok
  end

  it "should return 404" do
    get '/not_exist'
    expect(last_response.status).to eq(404)
  end
end
