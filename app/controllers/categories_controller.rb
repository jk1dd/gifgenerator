class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @user = current_user
  end

  def index
    @categories = Category.all
  end
end
