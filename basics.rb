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

# creates a route where anything after '/hello' will be contained in a `params` array with the key `:name`.
# `params` array contains all GET and POST variables

get '/hello/:name' do
    "Aloha, #{params[:name]}. If you're here and I'm here, isn't it our time?"
end