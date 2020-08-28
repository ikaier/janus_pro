require 'pry-byebug'


class WishlistsController < ApplicationController
  def index
    @wishlists = Wishlist.where({ :user => current_user })
    @products = []
    @wishlists.each do |wishlist|
      @products << wishlist.product
    end

  end

  def new
    @wishlists = Wishlist.new
  end

  def create

    @wishlist = Wishlist.new
    @product = Product.new(product_params)
    @product.save
    @wishlist.product = @product
    @wishlist.user = current_user
    @wishlist.save

  end

  def destroy
    @wishlist = Wishlist.find(params[:id])
    @wishlist.destroy
  end

  private

  def wishlist_params
    params.require(:wishlist).permit(:product_id)
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :url, :rating, :photo)
  end
end
