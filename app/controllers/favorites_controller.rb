class FavoritesController < ApplicationController
  def create
    
    redirect_to user_path(current_user)
  end
end
