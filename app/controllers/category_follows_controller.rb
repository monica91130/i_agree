class CategoryFollowsController < ApplicationController
  before_action :authenticate_user!

  def create
  	user = current_user
    category = Category.find(params[:category_id])
    CategoryFollow.create(user_id: user.id, category_id: category.id)
    redirect_to category_path(category.id)
  end

  def destroy
  	user = current_user
    category = Category.find(params[:category_id])
    category_folllow = CategoryFollow.find_by(user_id: user.id,category_id: category.id)
    if category_folllow.destroy
     redirect_to Rails.application.routes.recognize_path(request.referer), notice: "フォローを解除しました"
    else
     redirect_to Rails.application.routes.recognize_path(request.referer)
    end
  end
end
