class ProductsController < ApplicationController
  def index

    @products = Product.all

  end

    if params[:search].blank?
      redirect_to(root_path, alert: "Empty field!") and return
    else
      @parameter = params[:search].downcase
      @products = Product.all
      @scrapper = EbayScrapper.new("earphone")
      #@scrapper = AmazonScrapper.new("earphone")
      @infos = @scrapper.scrap
      end
    end












>>>>>>> master

  def create
    @product = Product.new(params[:product])
    @product.save
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :url, :rating, :photo)
  end
end
