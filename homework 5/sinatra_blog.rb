require 'sinatra'
require 'sinatra/activerecord'
require './models'

set :database, 'sqlite3:homework5.sqlite3'

get '/' do
	@user = User.find(1)
	erb :home
end