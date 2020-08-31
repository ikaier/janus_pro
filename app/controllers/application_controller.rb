class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  def number_of_wishlists
    return Wishlist.where({ :user => current_user }).count
  end
  helper_method :number_of_wishlists
end
