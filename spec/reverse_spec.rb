require_relative './spec_helper.rb'
require File.dirname(__FILE__) + '/../reverse.rb'

describe "Reverse Service" do
  it "should reverse the string you provide it" do
    expect(reverse("George")).to eq("egroeG")
  end
end
