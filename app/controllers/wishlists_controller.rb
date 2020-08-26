class WishlistsController < ApplicationController
  def index
    @wishlists = Wishlist.all
  end
end
