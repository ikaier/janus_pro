class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  layout 'home-layout', only: [ :home ]

  def home
  end
end
