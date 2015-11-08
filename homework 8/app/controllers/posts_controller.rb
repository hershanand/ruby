class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def show
		@detailedPost = Post.find(params[:id])
	end

	def destroy
		@delete = Post.find(params[:id])
		if @delete.destroy
			flash[:notice] = 'Post deleted'
		else
			flash[:alert] = 'There was a problem deleting the post'
		end
		redirect_to posts_path
	end

	def create
		@post = Post.new(params[:post])
		@post.user_id = 2
		if @post.save
			flash[:notice] = 'Post created'
		else
			flash[:alert] = 'There was a problem creating your post'
		end
		redirect_to posts_path

	end
end
