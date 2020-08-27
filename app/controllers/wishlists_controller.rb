class WishlistsController < ApplicationController
  def index
    @wishlists = Wishlist.all
  end

  def new
    @wishlists = Wishlist.new
  end

  def create
    @wishlist = Wishlist.new
    @wishlist.product = Product.find(params[:product_id])
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
end
