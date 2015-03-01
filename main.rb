require 'sinatra'
require 'slim'
require 'sass'
require "sinatra/activerecord"
require_relative './models/song'

register Sinatra::ActiveRecordExtension
ENV["RACK_ENV"] = 'development'

configure do
  enable :sessions
  set :username, 'george'
  set :password, 'sinatra'
end

get('/styles.css') {scss :styles}

get '/' do
  slim :home
end

get '/set/:name' do
  session[:name] = params[:name]
end

get '/get/hello' do
  "Hello #{session[:name]}"
end

get '/login' do
  slim :login
end

post '/login' do
  if params[:username] == settings.username && params[:password] == settings.password
    session[:admin] = true
    redirect to('/songs')
  else
    slim :login
  end
end

get '/logout' do
  session.clear
  redirect to('/login')
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

get '/songs/new' do
  halt(401, 'Now Authorized') unless session[:admin]
  @song = Song.new
  slim :new_song
end

post '/songs' do
  song = Song.create(params[:song])
  redirect to("/songs/#{song.id}")
end

get '/songs/:id' do
  @song = Song.find(params[:id])
  slim :show_song
end

get '/songs/:id/edit' do
  @song = Song.find(params[:id])
  slim :edit_song
end

put '/songs/:id' do
  song = Song.find(params[:id])
  song.update(params[:song])
  redirect to("/songs/#{song.id}")
end

delete '/songs/:id' do
  Song.find(params[:id]).destroy
  redirect to('/songs')
end

not_found do
  slim :not_found
end
