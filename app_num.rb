# app_num.rb

require "rubygems"
require "sinatra"
require_relative "num_to_words"

get '/' do
    "<html>
    <body>
    <form action='/words'>
    <input type='text' name='text'>
    <input type='submit'>
    </form>
    </body>
    </html>
    "
end

get '/words' do
    params[:text].in_words
end