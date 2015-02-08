require 'sinatra/activerecord'

class Song < ActiveRecord::Base
  validates_uniqueness_of :title
  validates_presence_of :title

  #def released_on=(date)
    #super Date.strptime(date, '%m/%d/%Y')
  #end
end
