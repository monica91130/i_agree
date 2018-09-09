class PostsController < ApplicationController
	before_action :authenticate_user!
	before_action :correct_user,   only: [:edit, :update, :destroy]

	def new
		@post = Post.new
	end

	def create
		# binding.pry
		post = Post.new(post_params)
		post.user_id = current_user.id
		# binding.pry
		post.save
		redirect_to user_path(current_user.id), notice: "投稿しました"
	end

	def show
		@post = Post.find(params[:id])
	end

	def destroy
		post = Post.find(params[:id])
		post.destroy
		redirect_to Rails.application.routes.recognize_path(request.referer), notice: "投稿を削除しました"
	end

	def search
		@search = params[:search]
	end

	def index
      # @search = params[:search]
      # binding.pry
      # if @search.present?
         # @posts = Post.search(params[:search])
         @posts = Post.all
         @posts = @posts.body_like(params[:search])
         # @categories = Category.recent_like(params[:search]) if params[:search].present?
      # else
      # end
  end



	private
   	def post_params
       # params.require(:post).permit(:body, :category_id, :tag_id)
       params.require(:post).permit(:body, :category_id)
   	end
end
