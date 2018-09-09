class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :correct_user,   only: [:edit, :update]

  def index
  	@users = User.all
  end

  def show
  	@user = User.find(params[:id])
  	@user_posts = Post.where(user_id: @user.id)
  	@category_follows = CategoryFollow.where(user_id: @user.id)
  	cf = @category_follows.pluck(:category_id)
  	@category_posts = Post.where(category_id: cf, user_id: @user.id)
  	@agrees = Agree.where(user_id: @user.id)
  	@user_follows = @user.all_following
  	@user_followers = @user.followers
  	@posts = Post.where(category_id: cf).or(Post.where(user_id: @user.id)).or(Post.where(user_id: @user_follows))
  end

  def destroy
  	user = User.find(params[:id])
	user.destroy
	redirect_to users_path
  end

  def follow_create
  	puts params[:id]
  	following_user = current_user
	followed_user = User.find(params[:id])
	following_user.follow(followed_user)
    redirect_to Rails.application.routes.recognize_path(request.referer)
  end

  def follow_destroy
  	following_user = current_user
	followed_user = User.find(params[:id])
  	following_user.stop_following(followed_user)
    redirect_to Rails.application.routes.recognize_path(request.referer)
  end

  def edit
  	@user = current_user
  end

  def update
  	user = current_user
  	if current_user.update(user_params)
      flash[:notice] = "変更が保存されました"
      redirect_to user_path(current_user)
  	end
  end

  private

  def user_params
      params.require(:user).permit(:name, :image, :age, :profession, :gender)
  end

  def correct_user
    @user = User.find(params[:id])
      redirect_to root_path unless @user == current_user
  end
end
