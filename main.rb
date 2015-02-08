require 'sinatra'
require 'slim'
require 'sass'
require "sinatra/activerecord"
#require File.dirname(__FILE__) + '/config/database.rb'

register Sinatra::ActiveRecordExtension

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

not_found do
  slim :not_found
end
