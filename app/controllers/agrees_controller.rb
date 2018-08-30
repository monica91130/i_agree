class AgreesController < ApplicationController
  before_action :authenticate_user!
  
  def create
  	user = current_user
    post = Post.find(params[:post_id])
    agree = Agree.create(user_id: user.id, post_id: post.id)
    # logger.info("-------------------------------")
    # logger.info(agree.errors.full_messages)
    # logger.info("-------------------------------")
    # category = Category.find_by(params[:id])
    redirect_to Rails.application.routes.recognize_path(request.referer), notice: "agreeしました"
  end

  def destroy
  	user = current_user
    post = Post.find(params[:post_id])
    agree = Agree.find_by(user_id: user.id, post_id: post.id)
    if agree.destroy
     redirect_to Rails.application.routes.recognize_path(request.referer), notice: "agreeを消しました"
    else
     redirect_to Rails.application.routes.recognize_path(request.referer)
    end
  end
end
