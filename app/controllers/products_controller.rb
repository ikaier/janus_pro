class ProductsController < ApplicationController
  def index
    @products = Product.all
    @scrapper = AmazonScrapper.new("phone")
    #@scrapper = EbayScrapper.new("monitor")
    @infos = @scrapper.scrape
  end

  def create
    @product = Product.new(params[:product])
    @product.save
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :url, :rating, :photo)
  end
end
