require 'rubygems'
require 'sinatra'

# tells Sinatra that if the home, or root, URL '/' is requested using GET HTTP method, display "Hello, World!"

get '/' do
    "Hello, World!"
end

# if the '/about' URL is requested (using GET HTTP method), "A little about me" will display

get '/about' do
    'A little about me.'
end

# creates a route where anything after '/hello' will be contained in a `params` hash with the key `:name`.
# `params` array contains all GET and POST variables

get '/hello/:name/:city/:state/:food' do
    "Aloha, #{params[:name].upcase}! If you're here and I'm here, isn't it our time?  Anyway, aren't you from #{params[:city].upcase}? That's in #{params[:state].upcase}, so you should be laid back, brah!  And certainly there's nothing wrong with enjoying a little #{params[:food].upcase} on our time."
end