class ProductsController < ApplicationController
  def index



    if params[:search].blank?
      redirect_to(root_path, alert: "Empty field!") and return
    else
      @parameter = params[:search].downcase
      @products = Product.all

      #@scrapper = EbayScrapper.new(@parameter)
      @scrapper = AmazonScrapper.new(@parameter)

      arramazon = @scrapper.scrape
      @scrapper = EbayScrapper.new(@parameter)
      arrebay = @scrapper.scrap

      @infos = arrebay + arramazon
      if @infos.empty?
        redirect_to(no_result_path) and return
      end
    end

  
  end

  def noresult
  end



  def create
    @product = Product.new(params[:product])
    @product.save
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :url, :rating, :photo)
  end
end
