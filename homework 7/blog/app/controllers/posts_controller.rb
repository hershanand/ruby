class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@detailedPost = Post.find(params[:id])
		
	end
end
