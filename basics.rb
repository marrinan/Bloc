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

# Anything included in the URL after "more" will be accessible through the `:splat` key in the `params` hash (AKA: array)
# http://127.0.0.1:9393/more/splat
get '/more/*' do
	params[:splat]
end

# loads the `form.erb` Embedded Ruby file from a `views/` directory.
# ERB allows you to embed code in a web page in a similar way as PHP or ASP
get '/form' do
	erb :form
end

