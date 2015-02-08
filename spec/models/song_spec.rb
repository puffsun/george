require File.dirname(__FILE__) + '/../../models/song.rb'
require_relative '../spec_helper.rb'

describe :Song do

  before :all do
    @s1 = Song.create(title: "title1")
    @s2 = Song.create(title: "title1")
  end

  it "should contains necessary attributes" do
    instance_methods = [:title, :lyrics, :length, :released_on]
    instance_methods.each do |m|
      expect(@s1.respond_to? m).to be_truthy
      expect(@s1.respond_to? (m.to_s + "=").to_sym).to be_truthy
    end
  end

  it "should not contain duplicated title attribute" do
    expect(Song.count).to eq(1)
    expect(Song.first.title).to eq("title1")
    expect(Song.last.title).to eq("title1")
  end
end
