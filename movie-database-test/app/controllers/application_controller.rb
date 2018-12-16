class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_page_title
  before_action :set_star_path

  private 
  
  def set_page_title
    @page = "home"
  end

  def set_star_path
    # group :development, :test do
    #   @star_path = "/assets/"
    # end

    # group :production do
    #   @star_path = "public/assets/"
    # end

    @star_path = "/assets/"
    
  end

end
