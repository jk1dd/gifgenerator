class GifsController < ApplicationController
  def favorite
    @gif = Gif.find(params[:id])
    type = params[:type]
    if type == "favorite"
      current_user.gifs << @gif unless current_user.gifs.include?(@gif)
      redirect_to :back, notice: "You favorited this gif"
    elsif type == "unfavorite"
      current_user.gifs.delete(@gif)
      redirect_to :back, notice: "You removed this gif from favorites"
    else
      redirect_to :back, notice: "Nothing happened."
    end
  end
end
