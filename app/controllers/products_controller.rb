class ProductsController < ApplicationController
  def index



    if params[:search].blank?
      redirect_to(root_path, alert: "Empty field!") and return
    else
      @parameter = params[:search].downcase
      @products = Product.all
      #@scrapper = EbayScrapper.new(@parameter)
      @scrapper = AmazonScrapper.new(@parameter)

      arramazon = @scrapper.scrap
      @scrapper = EbayScrapper.new(@parameter)
      arrebay = @scrapper.scrap
      @infos = arrebay + arramazon
    end
  end



  def create
    @product = Product.new(params[:product])
    @product.save
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :url, :rating, :photo)
  end
end
