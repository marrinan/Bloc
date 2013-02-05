require "rubygems"
require "sinatra"
# looks at local files first rather than public libraries "./"
require_relative "num_to_words"

# route to root director
get '/' do
    "<html>
        <body>
    # when user clicks submit send route below
            <form action='/words'>
    # create text box
        <input type='text' name='text'>
        <input type='submit'>
            </form>
        </body>
    </html>
    "
end

get '/words' do
    params[:text].to_i.in_words
end