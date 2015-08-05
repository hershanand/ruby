require 'sinatra'

get '/' do
	erb :home
end

get '/about' do
	erb :about
end

get '/contact' do
	erb :contact
end

get '/thankyou' do
	@name = params[:name]
	@email = params[:email]
	@message = params[:message]

	erb :thankyou
end