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

helpers do
  def css(*stylesheets)
    stylesheets.map do |style|
      "<link href=\"#{style}.css\" media=\"screen, projection\" rel=\"stylesheet\">"
    end.join
  end

  def current?(path='/')
    (request.path == path || request.path == path + '/') ? "current" : nil
  end

  def set_title
    @title ||= "Songs By Sinatra"
  end
end

get('/styles.css') {scss :styles}

before do
  set_title
end

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
  find_songs
  slim :songs
end

get '/songs/new' do
  halt(401, 'Now Authorized') unless session[:admin]
  @song = Song.new
  slim :new_song
end

post '/songs' do
  create_song
  redirect to("/songs/#{song.id}")
end

get '/songs/:id' do
  @song = find_song
  slim :show_song
end

get '/songs/:id/edit' do
  @song = find_song
  slim :edit_song
end

put '/songs/:id' do
  song = find_song
  song.update(params[:song])
  redirect to("/songs/#{song.id}")
end

delete '/songs/:id' do
  find_song.destroy
  redirect to('/songs')
end

not_found do
  slim :not_found
end
