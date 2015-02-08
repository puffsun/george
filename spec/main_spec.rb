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

  it "should return all songs" do
    get '/songs'
    expect(last_response).to be_ok
  end

  it "should return a song with specified id" do
    Song.create(title: "Come Fly With Me", lyrics: "Come fly with me, let's fly, let's fly away ... .", length: 199, released_on: Date.new(1958,1,6))
    id = Song.last.id
    get "/songs/#{id}"
    expect(last_response).to be_ok
  end

  it "should return new song page" do
    get '/songs/new'
    expect(last_response).to be_ok
  end

  it "should create new song" do
    post '/songs', {title: "Fly With Me", lyrics: "Come fly with me, let's fly, let's fly away ... .", length: 199, released_on: Date.new(1958,1,6)}
    expect(last_response.status).to eq(302)
    #expect(Song.find_by_title('Fly With Me')).to_not be_nil
  end

  it "should edit selected song" do
    song = Song.last
    get "/songs/#{song.id}/edit"
    expect(last_response).to be_ok
  end

  it "should update the selected song" do
    song = Song.last
    put "/songs/#{song.id}", { song: {
        title: song.title,
        lyrics: song.lyrics,
        length: 333,
        released_on: song.released_on
      }
    }
    expect(last_response.status).to eq(302)
    updated_song = Song.find(song.id)
    expect(updated_song.length).to eq(333)
  end

  it "should delete the selected song" do
    song = Song.last
    count = Song.count
    delete "/songs/#{song.id}"
    expect(last_response.status).to eq(302)
    expect(count).to eq(Song.count + 1)
  end
end
