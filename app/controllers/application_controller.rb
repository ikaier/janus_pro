class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def number_of_wishlists
    return Wishlist.where({ :user => current_user }).count
  end
  helper_method :number_of_wishlists

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :photo, :password, :password_confirmation])
  end
end
