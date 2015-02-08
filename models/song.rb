require 'sinatra/activerecord'

class Song < ActiveRecord::Base
  validates_uniqueness_of :title
  validates_presence_of :title
end
