# require 'faraday'
require 'json'
class Admin::CategoriesController < Admin::BaseController
  def new
    @category = Category.new
  end

  def create
    @name = params[:category][:name]
    response = Faraday.get("http://api.giphy.com/v1/gifs/search?q=#{@name}&api_key=dc6zaTOxFJmzC")
    raw_data = response.body
    data = JSON.parse(raw_data)
    url = data["data"][1]["embed_url"]
    @category = Category.new(category_params)
    if @category.save
      @category.gifs.create(image_url: url)
      redirect_to category_path(@category)
    else
      render :new
    end
    # response = Faraday.get("http://api.giphy.com/v1/gifs/search?q=funny+cat&api_key=dc6zaTOxFJmzC")
    # # Category.gifs.create(image_url: url)
    # GIF.create(image_url: url)

  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
