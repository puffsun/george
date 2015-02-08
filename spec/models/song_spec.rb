require File.dirname(__FILE__) + '/../../models/song.rb'
require_relative '../spec_helper.rb'

describe :Song do

  before :all do
    @song = Song.create(title: "Come Fly With Me", lyrics: "Come fly with me, let's fly, let's fly away ... .", length: 199, released_on: Date.new(1958,1,6))
  end

  it "should contains necessary attributes" do
    instance_methods = [:title, :lyrics, :length, :released_on]
    instance_methods.each do |m|
      expect(@song.respond_to? m).to be_truthy
      expect(@song.respond_to? (m.to_s + "=").to_sym).to be_truthy
    end
  end

  it "should not contain duplicated title attribute" do
    @song = Song.create(title: "Come Fly With Me", lyrics: "Come fly with me, let's fly, let's fly away ... .", length: 199, released_on: Date.new(1958,1,6))
    expect{Song.count}.to change{Song.count}.by(0)
  end
end
