require 'sinatra'

def reverse(str)
  str.each_char.to_a.reverse.join
end

get '/' do
  "Hello World."
end
