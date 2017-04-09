# require 'faraday'
require 'json'
class Admin::CategoriesController < Admin::BaseController
  def new
    @category = Category.new
  end

  def create
    @name = params[:category][:name]
    response = Faraday.get("http://api.giphy.com/v1/gifs/translate?s=#{@name}&api_key=dc6zaTOxFJmzC")
    raw_data = response.body
    data = JSON.parse(raw_data)
    url = data["data"]["embed_url"]
    @category = Category.find_or_initialize_by(category_params)
    if @category.save
      @category.gifs.create(image_url: url)
      redirect_to category_path(@category)
    else
      render :new
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
