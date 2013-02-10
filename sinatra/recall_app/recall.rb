require 'sinatra'
require 'data_mapper'

# Sets up a new SQLite3 database in the current directory, named recall.db
DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/recall.db")
# Calls the class 'Note' and has DataMapper create the table
class Note
	include DataMapper::Resource
# Sets up database schema -- 'Notes' table has five fields
	property :id, Serial
	property :content, Text, :required => true
	property :complete, Boolean, :required => true, :default => false
	property :created_at, DateTime
	property :updated_at, DateTime
end
# Instructs DataMapper to automatically update the database
DataMapper.finalize.auto_upgrade!

get '/' do
# Retrieves all notes from the database and assigns to the @notes instance variable
	@notes = Note.all :order => :id.desc
# Sets the @title instance variable, and loads the views/home.erb view files through the ERB parser
	@title = 'All Notes'
	erb :home
end

# When a post request is made on the homepage, we create a new Note object in n
post '/' do
	n = Note.new
	n.content = params[:content]
	n.created_at = Time.now
	n.updated_at = Time.now
	n.save
	redirect '/'
end

get '/:id' do
	@note = Note.get params[:id]
	@title = "Edit note ##{params[:id]}"
	erb :edit
end

put '/:id' do
	n = Note.get params[:id]
	n.content = params[:content]
	n.complete = params[:complete] ? 1 : 0
	n.updated_at = Time.now
	n.save
	redirect '/'
end

get '/:id/delete' do
	@note = Note.get params[:id]
	@title = "Confirm deletion of note ##{params[:id]}"
	erb :delete
end

delete '/:id' do
	n = Note.get params[:id]
	n.destroy
	redirect '/'
end

get '/:id/complete' do
	n = Note.get params[:id]
	n.complete = n.complete ? 0 : 1 # flip it
	n.updated_at = Time.now
	n.save
	redirect '/'
end

# Retrieves the requested note from the database using the ID provided, set up 
# @title variable, and load the views/edit.erb view file through the ERB parser
get '/:id' do
	@note = Note.get params[:id]
	@title= "Edit note ##{params[:id]}"
	erb :edit
end

put '/:id' do
  n = Note.get params[:id]
  n.content = params[:content]
  n.complete = params[:complete] ? 1 : 0
  n.updated_at = Time.now
  n.save
  redirect '/'
end

get '/:id/delete' do
  @note = Note.get params[:id]
  @title = "Confirm deletion of note ##{params[:id]}"
  erb :delete
end

# Creates the delete route for a note
delete '/:id' do
  n = Note.get params[:id]
  n.destroy
  redirect '/'
end

get '/:id/complete' do
  n = Note.get params[:id]
  n.complete = n.complete ? 0 : 1 # flip it
  n.updated_at = Time.now
  n.save
  redirect '/'
end