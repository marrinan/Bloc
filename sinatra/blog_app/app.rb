# app.rb

require "rubygems"
require "sinatra"

get '/' do
    erb :index
end

get '/post' do
    @string = params["text"]
    erb :post
end

post '/post' do
    @string = params["text"]
    erb :post
end