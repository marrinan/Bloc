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

# if the '/about' URL is requested (using GET HTTP method), "A little about me" will display

get '/hello/:name' do
    params[:name]
end