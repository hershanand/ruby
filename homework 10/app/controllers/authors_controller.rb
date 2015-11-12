class AuthorsController < ApplicationController
	def index
		@authors = Author.all
	end

	def new
		@author = Author.new
	end

	def edit
		@update = Author.find(params[:id])
	end

	def update
		#puts params.inspect
		@update = Author.find(params[:id])
		if @update.update_attributes(params[:author])
			flash[:notice] = 'Author was updated'
		else
			flash[:alert] = 'There was a problem updating the author'
		end
		redirect_to root_path
	end

	def destroy
		@delete = Author.find(params[:id])
		if @delete.destroy
			flash[:notice] = 'Author was removed'
		else
			flash[:alert] = 'There was a problem removing the author'
		end
		redirect_to authors_path
	end

	def create
		@author = Author.new(params[:author])
		if @author.save
			flash[:notice] = 'New Author Added!'
		else
			flash[:alert] = 'There was a problem creating adding the author'
		end
		redirect_to authors_path

	end
end
