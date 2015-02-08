require 'sinatra'
require 'slim'
require 'sass'
require "sinatra/activerecord"
require_relative './models/song'

register Sinatra::ActiveRecordExtension
ENV["RACK_ENV"] = 'development'

get('/styles.css') {scss :styles}

get '/' do
  slim :home
end

get '/about' do
  @title = "All About This Website"
  slim :about
end

get '/contact' do
  @title = "We Are Listening"
  slim :contact
end

get '/songs' do
  @songs = Song.all
  slim :songs
end

not_found do
  slim :not_found
end
