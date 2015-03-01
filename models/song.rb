require 'sinatra/activerecord'

module SongHelpers
  def find_songs
    @songs = Song.all
  end

  def find_song
    Song.get(params[:id])
  end

  def create_song
    @song = Song.create(params[:song])
  end
end

helpers SongHelpers

class Song < ActiveRecord::Base
  validates_uniqueness_of :title
  validates_presence_of :title

  #def released_on=(date)
  #super Date.strptime(date, '%m/%d/%Y')
  #end
end

