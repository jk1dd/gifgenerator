class GifsController < ApplicationController
  def favorite
    @gif = Gif.find(params[:id])
    type = params[:type]
    if type == "favorite"
      current_user.gifs << @gif unless current_user.gifs.include?(@gif)
      flash[:notice] = "Successfully added to favorites!"
      redirect_back(fallback_location: category_path(@gif.category))
    elsif type == "unfavorite"
      current_user.gifs.delete(@gif)
      flash[:notice] = "Successfully removed from favorites!"
      redirect_back(fallback_location: user_path(current_user))
    else
      redirect_back(fallback_location: category_path(@gif.category))
      flash[:notice] = "Nothing happened."
    end
  end
end
