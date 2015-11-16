class UsersController < ApplicationController
	protect_from_forgery :except => [:foo]

	def index
		puts params.inspect
		
		#@cafes = params[:data_value]
	end

	def create

	end

	def favorite
		@cafes = params[:place]
		@cafeaddy = params[:address]
		#render :nothing => true, :status => 200, :content_type => 'application/json'
	end

end
