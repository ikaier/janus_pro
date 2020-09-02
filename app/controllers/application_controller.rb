class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  def number_of_wishlists
    return Wishlist.where({ :user => current_user }).count
  end
  helper_method :number_of_wishlists

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end
end


